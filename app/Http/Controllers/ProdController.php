<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Cat;
use App\Models\Subcat;
use App\Models\Prod;
use Illuminate\Http\Response;
use Illuminate\Validation\Rule;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Mews\Purifier\Facades\Purifier;
use Illuminate\Support\Facades\Storage;






class ProdController extends Controller
{
    protected function ensureSuperadmin(Request $request)
	{
		if (!$request->user() || !$request->user()->hasRole('superadmin')) {
			abort(403, 'Forbidden. Superadmin only.');
		}
	}
	
	protected function ensureAdmin(Request $request)
	{
		if (!$request->user() || (!$request->user()->hasRole('superadmin') && !$request->user()->hasRole('admin')  )) {
			abort(403, 'Forbidden. Superadmin or Admin only.');
		}
	}
	
	private function handlePdfUpload(Request $request, string $generatedName, string $randomSuffix): ?string
	{
		if ($request->hasFile('pdf')) {
			$pdfFile = $request->file('pdf');
			$pdfExtension = $pdfFile->getClientOriginalExtension();
			$pdfName = $generatedName . '-' . $randomSuffix . '.' . $pdfExtension;
			$pdfFile->move(public_path('prod/pdf'), $pdfName);

			return 'prod/pdf/' . $pdfName;
		}

		return null;
	}


	private function handleImageUpload(Request $request, string $generatedName, string $randomSuffix): ?string
	{
		if (!$request->hasFile('img')) {
			return null;
		}

		$imgFile = $request->file('img');
		$imgExtension = $imgFile->getClientOriginalExtension();
		$imgName = $generatedName . '-' . $randomSuffix . '.' . $imgExtension;

		$originalPath = public_path('prod/img/' . $imgName);
		$thumbPath = public_path('prod/img/thumb/' . $imgName);

		// Ensure thumbnail directory exists
		if (!file_exists(public_path('prod/img/thumb'))) {
			mkdir(public_path('prod/img/thumb'), 0777, true);
		}

		$image = Image::make($imgFile);

		// Resize original only if needed
		if ($image->width() > 1500 || $image->height() > 1000) {
			$image->resize(1500, 1000, function ($constraint) {
				$constraint->aspectRatio();
				$constraint->upsize();
			});
		}

		$image->save($originalPath);

		// Create thumbnail (200x200 fixed size)
		Image::make($imgFile)->fit(200, 200)->save($thumbPath);

		return 'prod/img/' . $imgName;
	}


	
	
	
	
	
	public function indexsuperadmin(Request $request, $catid = '' , $subid = '')
    {
        $this->ensureSuperadmin($request);
		$perPage = $request->get('per_page', 5); // Default to 10 if not provided
		
		$sortField = $request->get('sortField', 'id'); 
		$sortDirection = $request->get('sortDirection', 'desc'); 
		$search = $request->get('search', ''); 
		
	    $allowedSortFields = ['id', 'name', 'catid' , 'subid' , 'ordd' , 'vis']; 
		if (!in_array($sortField, $allowedSortFields)) {
			$sortField = 'id';
		}

		// Validate direction
		$sortDirection = strtolower($sortDirection) === 'asc' ? 'asc' : 'desc';
		
		$categoryName = null;
		
		if ($catid) {
			$category = Cat::find($catid);
			$categoryName = $category ? $category->name : null;
		}
			
		$subcategoryName = null;
		
		if ($subid) {
			$subcategory = Subcat::find($subid);
			$subcategoryName = $subcategory ? $subcategory->name : null;
		}
		
		
		
		$cats = Cat::orderBy("name", 'asc')->get();
		$subs = Subcat::orderBy("name", 'asc')->get();
		$prods = Prod::with('cat')->with('sub')->
			where(function($query) use ($search) {
				if ($search) {
					$query->where('name', 'like', "%{$search}%");
				}
			})->
			where(function($query) use ($catid) {
				if ($catid) {
					$query->where('catid', '=', $catid);
				}
			})->
			where(function($query) use ($subid) {
				if ($subid) {
					$query->where('subid', '=', $subid);
				}
			})->
			orderBy($sortField, $sortDirection)->
			paginate($perPage);

		return response()->json([
			'cats' => $cats,
			'subs' => $subs,
			'prods' => $prods,
			'category_name' => $categoryName,
			'subcategory_name' => $subcategoryName,
			'log_info' => "Fetching prods, cats and subcats",
		]);
    }
	
	public function addsuperadmin(Request $request,  $catid='' ,  $subid='')
    {
        $this->ensureSuperadmin($request);
	
		$cats = Cat::orderBy("name", 'asc')->get();
		$subs = Subcat::orderBy("name", 'asc')->get();
		return response()->json([
            'message' => "Row to Add ",
            'cats' => $cats, 'catid' => $catid ,
			'subs' => $subs, 'subid' => $subid
        ]);
    }
	
	public function editsuperadmin(Request $request, $id)
    {
        $this->ensureSuperadmin($request);
		$prod = Prod::with('cat')->with('subcat')->find($id);
		
		if (!$prod) 
		{
			return response()->json(['message' => 'Product not found'], 404);
		}
			
		
		$cats = Cat::orderBy("name", 'asc')->get();
		$subs = Subcat::orderBy("name", 'asc')->get();
		$subid = $prod->subid;
		$catid = $prod->catid;
		return response()->json([
            'message' => "Row to Edit $id",
            'prod' => $prod , 
			'cats' => $cats, 'catid' => $catid, 
			'subs' => $subs, 'subid' => $subid ,
			'id' => $id

        ]);
    }
	
	
	public function storesuperadmin(Request $request)
	{
		$this->ensureSuperadmin($request);	
		$validated = $request->validate([
				'name' => [
					'required',
					'string',
					'max:255',
					Rule::unique('prods')->where(function ($query) use ($request) {
						return $query->where('catid', $request->catid)
									 ->where('subid', $request->subid);
					}),
				],
				'catid' => 'required|numeric|exists:cats,id',
				'subid' => 'required|numeric|exists:subcats,id',
				'des' => 'nullable|string|max:5000',
				'dess' => 'nullable|string',
				'prix' => 'nullable|numeric',
				'img' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:9120',
				'pdf' => 'nullable|file|mimes:pdf|max:9120',
				'vis' => 'required|in:0,1',
		]);
		$name = $validated['name'];
		$catid = $validated['catid'];
		$subid = $validated['subid'];
		$des = isset($validated['des']) ? substr($validated['des'], 0, 5000) : null;
		
		$dess = $validated['dess'] ?? null;
		$dess = $dess ? Purifier::clean($dess, [
			'HTML.Allowed' => 'p,b,strong,i,em,u,ul,ol,li,br,a[href|target],img[src|alt|width|height],h1,h2,h3,blockquote,span,div,table,tr,td,th,thead,tbody',
			'HTML.SafeIframe' => false, // disallow <iframe>
			'HTML.SafeObject' => false, // disallow <object> and <embed> tags
			'HTML.AllowedAttributes' => 'href,src,alt,width,height', // Allowed attributes for security
			'HTML.AllowedElements' => 'p,b,strong,i,em,u,ul,ol,li,br,a,img,h1,h2,h3,blockquote,span,div,table,tr,td,th,thead,tbody', // Safe elements only
			'HTML.SafeTags' => 'script,style,iframe,object,embed', // explicitly block dangerous tags
		]) : null;

		
		
		
		$prix = $request->prix;
		$quan = $request->filled('quan') ? $request->quan : 1;
		$newrecord = new Prod();
		$newrecord->name = $name;
		$newrecord->catid = $catid;
		$newrecord->subid = $subid;
		$newrecord->prix = $prix;
		$newrecord->quan = $quan;
		$newrecord->des = $des;
		$newrecord->dess = $dess;
		$newrecord->vis = $request->vis;
		$generatedName = $validated['name'] . '-' . Str::random(2);
		$randomSuffixImg = Str::random(5);  // For image
		$randomSuffixPdf = Str::random(5);  // For PDF (or other file)
		
		
		$newrecord->pdf = $this->handlePdfUpload($request, $generatedName, $randomSuffixPdf);
		$newrecord->img = $this->handleImageUpload($request, $generatedName, $randomSuffixImg);



		$newrecord->save();
		return response()->json(['message' => 'Product created successfully', 'newprod' => $newrecord], 201);
	}
	
	
	
	
	public function updatesuperadmin(Request $request, $id)
	{   
		$this->ensureSuperadmin($request);
		
		$prod = Prod::with('cat')->with('subcat')->find($id);
		
		if (!$prod) 
		{
			return response()->json(['message' => 'Product not found'], 404);
		}
		

		$request->validate([
			'catid' => 'required|numeric|exists:cats,id',
			'subid' => 'required|numeric|exists:subcats,id',
		]);

		// Now that we know catid and subid exist, continue validation
		$validated = $request->validate([
			'name' => [
				'required',
				'string',
				'max:255',
				Rule::unique('prods')
					->where(function ($query) use ($request) {
						return $query->where('catid', $request->catid)
									 ->where('subid', $request->subid);
					})
					->ignore($id),
			],
			'des' => 'nullable|string|max:5000',
			'dess' => 'nullable|string',
			'prix' => 'nullable|numeric',
			'img' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:9120',
			'pdf' => 'nullable|file|mimes:pdf|max:9120',
			'vis' => 'required|in:0,1',
		]);


		$name = $validated['name'];
		$catid = $validated['catid'];
		$subid = $validated['subid'];
		$des = isset($validated['des']) ? substr($validated['des'], 0, 5000) : null;
		
		$dess = $validated['dess'] ?? null;
		$dess = $dess ? Purifier::clean($dess, [
			'HTML.Allowed' => 'p,b,strong,i,em,u,ul,ol,li,br,a[href|target],img[src|alt|width|height],h1,h2,h3,blockquote,span,div,table,tr,td,th,thead,tbody',
			'HTML.SafeIframe' => false, // disallow <iframe>
			'HTML.SafeObject' => false, // disallow <object> and <embed> tags
			'HTML.AllowedAttributes' => 'href,src,alt,width,height', // Allowed attributes for security
			'HTML.AllowedElements' => 'p,b,strong,i,em,u,ul,ol,li,br,a,img,h1,h2,h3,blockquote,span,div,table,tr,td,th,thead,tbody', // Safe elements only
			'HTML.SafeTags' => 'script,style,iframe,object,embed', // explicitly block dangerous tags
		]) : null;

		
		
		$prod->vis = $request->vis;
		$prix = $request->prix;
		$quan = $request->filled('quan') ? $request->quan : 1;
		
		$prod->name = $name;
		$prod->catid = $catid;
		$prod->subid = $subid;
		$prod->prix = $prix;
		$prod->quan = $quan;
		$prod->des = $des;
		$prod->dess = $dess;
		
		$generatedName = $validated['name'] . '-' . Str::random(2);
		$randomSuffixImg = Str::random(5);  // For image
		$randomSuffixPdf = Str::random(5);  // For PDF (or other file)
		
		
		$prod->pdf = $this->handlePdfUpload($request, $generatedName, $randomSuffixPdf);
		$prod->img = $this->handleImageUpload($request, $generatedName, $randomSuffixImg);
		$prod->save();
		return response()->json(['message' => 'Product updated successfully', 'prod' => $prod], 200);
	}
	
	
	
	public function checkProd(Request $request)
	{
		$request->validate([
			'name' => 'required',
			'subid' => 'required|integer',
			'catid' => 'required|integer',
		]);

		$exists = Prod::where('name', $request->name)->
						where('subid', $request->subid)->
						where('catid', $request->catid)->
						exists();

		return response()->json(['exists' => $exists]);
	}

	public function checkProdEdit(Request $request)
	{
		$request->validate([
			'name' => 'required',
			'subid' => 'required|integer',
			'catid' => 'required|integer',
			'id' => 'required|integer',
		]);

		$exists = Prod::where('name', $request->name)
			->where('subid', $request->subid)
			->where('catid', $request->catid)
			->where('id', '!=', $request->id)
			->exists();

		return response()->json(['exists' => $exists]);
	}

	
	
	
	
	
	
	
	
	
}
