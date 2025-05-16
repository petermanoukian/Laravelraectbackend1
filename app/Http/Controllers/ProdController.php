<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Cat;
use App\Models\Subcat;
use App\Models\Prod;
use App\Models\Tagg;
use App\Models\Prodtagg;
use Illuminate\Http\Response;
use Illuminate\Validation\Rule;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;


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
	
	
	/*
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

		$manager = new ImageManager(new Driver()); // Use GD

		// Resize and save original image
		$image = $manager->read($imgFile->getPathname());

		if ($image->width() > 1500 || $image->height() > 1000) {
			$image->resize(1500, 1000, function ($constraint) {
				$constraint->aspectRatio();
				$constraint->upsize();
			});
		}

		$image->save($originalPath);

		// Create and save thumbnail (200x200 fixed crop)
		$manager->read($imgFile->getPathname())->cover(200, 200)->save($thumbPath);

		return 'prod/img/' . $imgName;
	}

	
	*/
	
	/*
	private function handlePdfUpload(Request $request, string $generatedName, string $randomSuffix): ?string
	{
		if ($request->hasFile('pdf')) {
			$pdfFile = $request->file('pdf');
			$pdfExtension = $pdfFile->getClientOriginalExtension();
			$generatedName = str_replace(" ","-",$generatedName);
			$pdfName = $generatedName . '-' . $randomSuffix . '.' . $pdfExtension;

			// More reliable than storeAs on Windows
			$pdfFile->move(storage_path('app/public/prod/pdf'), $pdfName);

			return 'storage/prod/pdf/' . $pdfName;
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
		$generatedName = str_replace(" ","-",$generatedName);
		$imgName = $generatedName . '-' . $randomSuffix . '.' . $imgExtension;

		// Paths in storage
		$originalPath = storage_path('app/public/prod/img/' . $imgName);
		$thumbPath = storage_path('app/public/prod/img/thumb/' . $imgName);

		// Ensure thumbnail directory exists
		if (!file_exists(storage_path('app/public/prod/img/thumb'))) {
			mkdir(storage_path('app/public/prod/img/thumb'), 0777, true);
		}

		$manager = new ImageManager(new Driver()); // Use GD

		// Resize and save original image
		$image = $manager->read($imgFile->getPathname());

		if ($image->width() > 1500 || $image->height() > 1000) {
			$image->resize(1500, 1000, function ($constraint) {
				$constraint->aspectRatio();
				$constraint->upsize();
			});
		}

		$image->save($originalPath);

		// Create and save thumbnail (200x200 fixed crop)
		$manager->read($imgFile->getPathname())->cover(200, 200)->save($thumbPath);

		// Return relative path
		return 'storage/prod/img/' . $imgName;
	}

	*/
	
	private function handlePdfUpload(Request $request, string $generatedName, string $randomSuffix): ?string
	{
		if ($request->hasFile('pdf')) {
			$pdfFile = $request->file('pdf');
			$pdfExtension = $pdfFile->getClientOriginalExtension();
			$generatedName = str_replace(" ","-",$generatedName);
			$pdfName = $generatedName . '-' . $randomSuffix . '.' . $pdfExtension;

			// Save to public/prod/pdf
			$pdfFile->move(public_path('prod/pdf'), $pdfName);

			return 'prod/pdf/' . $pdfName;  // Return relative path
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
		$generatedName = str_replace(" ","-",$generatedName);
		$imgName = $generatedName . '-' . $randomSuffix . '.' . $imgExtension;

		// Define paths in public directory
		$originalPath = public_path('prod/img/' . $imgName);
		$thumbPath = public_path('prod/img/thumb/' . $imgName);

		// Ensure the thumbnail directory exists
		if (!file_exists(public_path('prod/img/thumb'))) {
			mkdir(public_path('prod/img/thumb'), 0777, true);
		}

		$manager = new ImageManager(new Driver()); // Use GD

		// Resize and save original image
		$image = $manager->read($imgFile->getPathname());

		if ($image->width() > 1500 || $image->height() > 1000) {
			$image->resize(1500, 1000, function ($constraint) {
				$constraint->aspectRatio();
				$constraint->upsize();
			});
		}

		$image->save($originalPath);

		// Create and save thumbnail (200x200 fixed crop)
		$manager->read($imgFile->getPathname())->cover(200, 200)->save($thumbPath);

		// Return relative path
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
			$subs = Subcat::withCount('subprods')->where('catid', $catid)->orderBy('name', 'asc')->get();
		}
		else
		{
			$subs = Subcat::orderBy('name', 'asc')->get();
			$subs =[];
		}
		$subcategoryName = null;
		
		if ($subid) {
			$subcategory = Subcat::find($subid);
			$subcategoryName = $subcategory ? $subcategory->name : null;
		}

		$cats = Cat::withCount('subcats')->withCount('catprods')->orderBy("name", 'asc')->get();
		$alltaggs = Tagg::orderBy('name', 'asc')->get(['id', 'name']);

		//$subs = Subcat::orderBy("name", 'asc')->get();
		$prods = Prod::with('cat')->with('sub')->with('taggs')->
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
			})		
			->where(function ($query) use ($request) {
				if ($request->filled('taggids')) {
					$taggids = explode(',', $request->taggids);
					$query->whereHas('taggs', function ($q) use ($taggids) {
						$q->whereIn('taggs.id', $taggids);
					});
				}
			})
			->orderBy($sortField, $sortDirection)->
			paginate($perPage);

		return response()->json([
			'cats' => $cats,
			'subcats' => $subs,
			'prods' => $prods,
			'category_name' => $categoryName,
			'alltaggs' => $alltaggs,
			'subcategory_name' => $subcategoryName,
			'log_info' => "Fetching prods, cats and subcats",
		]);
    }
	
	public function addsuperadmin(Request $request,  $catid='' ,  $subid='')
    {
        $this->ensureSuperadmin($request);
	
		$cats = Cat::withCount('subcats')->withCount('catprods')->orderBy("name", 'asc')->get();
		$taggs = Tagg::orderBy("name", 'asc')->get();
		$categoryName = '';	
		$subcategoryName = '';
		
	    if (!empty($catid)) 
	    {
			$subs = Subcat::withCount('subprods')->where('catid', $catid)->orderBy('name', 'asc')->get();
			$category = Cat::find($catid);
			$categoryName = $category ? $category->name : null;
		} 
		else 
		{
			$subs = Subcat::orderBy('name', 'asc')->get();
			$subs =[];
		}
		
		if (!empty($subid)) 
	    {
			
			$subcategory = Subcat::find($subid);
			$subcategoryName = $subcategory ? $subcategory->name : null;
		} 
		else 
		{
			$subcategoryName = '';
		}

		
		return response()->json([
            'message' => "Row to Add ",
			'category_name' => $categoryName,
			'subcategory_name' => $subcategoryName,
            'cats' => $cats, 'catid' => $catid ,
			'subs' => $subs, 'subid' => $subid , 'taggs' => $taggs
        ]);
    }
	
	
	public function retrievesubsbycatssupradmin(Request $request,  $catid='' )
    {
        $this->ensureSuperadmin($request);
	    if (!empty($catid)) 
	    {
			$subs = Subcat::where('catid', $catid)->orderBy('name', 'asc')->get();
		} 
		else 
		{
			$subs =[];
		}
		return response()->json([

			'subs' => $subs
        ]);
    }

	
	public function editsuperadmin(Request $request, $id)
    {
        $this->ensureSuperadmin($request);
		$prod = Prod::with(['cat', 'sub', 'taggs'])->find($id);
		
		if (!$prod) 
		{
			return response()->json(['message' => 'Product not found'], 404);
		}
			
		
		$cats = Cat::orderBy("name", 'asc')->get();
		$subs = Subcat::orderBy("name", 'asc')->get();
		$subid = $prod->subid;
		$catid = $prod->catid;
		$taggs = Tagg::orderBy("name", 'asc')->get();
		$taggids = $prod->taggs->pluck('id');
		return response()->json([
            'message' => "Row to Edit $id",
            'prod' => $prod , 
			'cats' => $cats, 'catid' => $catid, 
			'subs' => $subs, 'subid' => $subid ,
			'taggs' => $taggs,           
        	'taggids' => $taggids,    
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
				'dess' => 'nullable|string|max:65535',
				'prix' => 'nullable|numeric',
				'ordd' => 'nullable|numeric',
				'img' => 'nullable|file|mimetypes:image/*|mimes:jpeg,jpg,png,gif,webp|max:9320',
				'pdf' => 'nullable|file|mimes:pdf,doc,docx,txt,jpeg,jpg,png|max:9320',
				'vis' => 'required|in:0,1',
				'taggids' => 'nullable|array',
				'taggids.*' => 'integer|exists:taggs,id',
		]);
		$name = $validated['name'];
		$catid = $validated['catid'];
		$subid = $validated['subid'];
		$catname = Cat::find($catid)?->name;
		$subcatname = Subcat::find($subid)?->name;
		
		$des = isset($validated['des']) ? substr($validated['des'], 0, 5000) : null;
		
		$dess = $validated['dess'] ?? null;
		$dess = $dess ? Purifier::clean($dess, [
			'HTML.Allowed' => 'p,b,strong,i,em,u,ul,ol,li,br,a[href|target],img[src|alt|width|height],h1,h2,h3,blockquote,span,div,table,tr,td,th,thead,tbody',
			'HTML.SafeIframe' => false, // Disallow <iframe> tags
			'HTML.SafeObject' => false, // Disallow <object> and <embed> tags
			'HTML.AllowedAttributes' => 'href,src,alt,width,height', // Allowed attributes for security
			'HTML.AllowedElements' => 'p,b,strong,i,em,u,ul,ol,li,br,a,img,h1,h2,h3,blockquote,span,div,table,tr,td,th,thead,tbody', // Safe elements only
		]) : null;


		$prix = $validated['prix'];
		$quan = $request->filled('quan') ? $request->quan : 1;
		$ordd = $request->filled('ordd') ? $request->ordd : 1;
		$newrecord = new Prod();
		$newrecord->name = $name;
		$newrecord->catid = $catid;
		$newrecord->subid = $subid;
		$newrecord->prix = $prix;
		$newrecord->quan = $quan;
		$newrecord->ordd = $ordd;
		$newrecord->des = $des;
		$newrecord->dess = $dess;
		$newrecord->vis = $request->vis;
		$generatedName = $validated['name'] . '-' . $catname. '-' . $subcatname. '-' . Str::random(3);
		$randomSuffixImg = Str::random(3);  // For image
		$randomSuffixPdf = Str::random(3);  // For PDF (or other file)
		
		$newrecord->pdf = $this->handlePdfUpload($request, $generatedName, $randomSuffixPdf);
		$newrecord->img = $this->handleImageUpload($request, $generatedName, $randomSuffixImg);
		$newrecord->save();	
		$tagIds = $validated['taggids'] ?? [];
		$newrecord->taggs()->sync($tagIds);
		
		return response()->json(['message' => 'Product created successfully', 'newprod' => $newrecord], 201);
	}
	
	
	
	
	public function updatesuperadmin(Request $request, $id)
	{   
		$this->ensureSuperadmin($request);
		
		$prod = Prod::with('cat')->with('sub')->find($id);
		
		if (!$prod) 
		{
			return response()->json(['message' => 'Product not found'], 404);
		}
		

			$validated = $request->validate([
				'catid' => 'required|numeric|exists:cats,id',
				'subid' => 'required|numeric|exists:subcats,id',
				'name' => [
					'required',
					'string',
					'max:255',
					Rule::unique('prods')
						->where(function ($query) use ($request) {
							return $query->where('catid', $request->input('catid'))
										 ->where('subid', $request->input('subid'));
						})
						->ignore($id),
				],
				'des' => 'nullable|string|max:5000',
				'dess' => 'nullable|string|max:65535',
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
			'HTML.SafeIframe' => false, // Disallow <iframe> tags
			'HTML.SafeObject' => false, // Disallow <object> and <embed> tags
			'HTML.AllowedAttributes' => 'href,src,alt,width,height', // Allowed attributes for security
			'HTML.AllowedElements' => 'p,b,strong,i,em,u,ul,ol,li,br,a,img,h1,h2,h3,blockquote,span,div,table,tr,td,th,thead,tbody', // Safe elements only
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
	
		if ($request->hasFile('pdf')) {
			$prod->pdf = $this->handlePdfUpload($request, $generatedName, $randomSuffixPdf);
		}

		if ($request->hasFile('img')) {
			$prod->img = $this->handleImageUpload($request, $generatedName, $randomSuffixImg);
		}
	
	
		$prod->save();

		$taggids = $request->input('taggids', []);
		$prod->taggs()->sync($taggids);

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


	public function destroysuperadmin($id)
    {

        $this->ensureSuperadmin(request());
		$row = Prod::find($id);

        if (!$row) 
		{
            return response()->json(['message' => 'not found'], Response::HTTP_NOT_FOUND);
        }

        $row->delete();

        return response()->json(['message' => ' deleted successfully'], Response::HTTP_OK);
    }
	
		
	public function deleteAllsuperadmin(Request $request)
	{
		$this->ensureSuperadmin(request());
		$ids = $request->input('prodids');

		if (!is_array($ids) || empty($ids)) {
			return response()->json(['message' => 'Invalid or empty  IDs'], 400);
		}


		$deletedCount = Prod::whereIn('id', $ids)->delete();

		return response()->json([
			'message' => "{$deletedCount} rows) deleted successfully"
		], Response::HTTP_OK);
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

	//tagprods starts here
	
	public function indexprodtagsuperadmin(Request $request, $prodid = 0, $taggid = 0)
	{
		$this->ensureSuperadmin($request);

		$perPage = $request->get('per_page', 5);
		$sortField = $request->get('sortField', 'id'); 
		$sortDirection = strtolower($request->get('sortDirection', 'desc')) === 'asc' ? 'asc' : 'desc';

		$searchProd = $request->get('searchProd', '');
		$searchTagg = $request->get('searchTagg', '');

		$allowedSortFields = ['id', 'prodid', 'taggid'];
		if (!in_array($sortField, $allowedSortFields)) {
			$sortField = 'id';
		}

		// Get tagg name
		$taggName = null;
		if (isset($taggid) && $taggid != 0) {
			$tagg = Tagg::find($taggid);
			$taggName = $tagg?->name;
		}

		// Get prod name
		$prodName = null;
		if (isset($prodid) && $prodid != 0) {
			$prod = Prod::find($prodid);
			$prodName = $prod?->name;
		}

		// All prods and taggs for dropdowns
		$prods = Prod::select('id', 'name')->orderBy('name', 'asc')->get();
		$taggs = Tagg::select('id', 'name')->orderBy('name', 'asc')->get();

		// Main query
		$prodtaggs = Prodtagg::with(['prod', 'tagg'])
			->when($searchProd, function ($query) use ($searchProd) {
				$query->whereHas('prod', function ($q) use ($searchProd) {
					$q->where('name', 'like', "%{$searchProd}%");
				});
			})
			->when($searchTagg, function ($query) use ($searchTagg) {
				$query->whereHas('tagg', function ($q) use ($searchTagg) {
					$q->where('name', 'like', "%{$searchTagg}%");
				});
			})
			->when($prodid != 0, fn($query) => $query->where('prodid', $prodid))
			->when($taggid != 0, fn($query) => $query->where('taggid', $taggid))
			->orderBy($sortField, $sortDirection)
			->paginate($perPage);

		return response()->json([
			'taggs' => $taggs,
			'prods' => $prods,
			'prodtaggs' => $prodtaggs,
			'prodName' => $prodName,
			'taggName' => $taggName,
			'log_info' => "Filtering by product and tagg names separately",
		]);
	}

	

	public function addprodtagsuperadmin(Request $request, $prodid = 0, $taggid = 0)
	{
		$this->ensureSuperadmin($request);

		$taggName = null;
		if ($taggid != 0) {
			$tagg = Tagg::find($taggid);
			$taggName = $tagg?->name;
		}

		$prodName = null;
		if ($prodid != 0) {
			$prod = Prod::find($prodid);
			$prodName = $prod?->name;
		}

		$prods = Prod::select('id', 'name')->withCount('taggs')->orderBy('name', 'asc')->get();
		$taggs = Tagg::select('id', 'name')->withCount('prods')->orderBy('name', 'asc')->get();

		return response()->json([
			'message' => "Row to Add",
			'prods' => $prods,
			'taggs' => $taggs, // <- was missing
			'prodName' => $prodName,
			'taggName' => $taggName,
			'prodid' => $prodid,
			'taggid' => $taggid,
		]);
	}


	public function editprodtagsuperadmin(Request $request, $id)
	{
		$this->ensureSuperadmin($request);
		// Retrieve the prodtagg record along with its related prod and tagg
		$prodtagg = Prodtagg::with(['prod', 'tagg'])->find($id);
		// If no prodtagg record is found, return a 404 error
		if (!$prodtagg) {
			return response()->json(['message' => 'Record not found'], 404);
		}

		// Get all products and all taggs
		$prods = Prod::select('id', 'name')->withCount('taggs')->orderBy('name', 'asc')->get();
		$taggs = Tagg::select('id', 'name')->withCount('prods')->orderBy('name', 'asc')->get();

		// Get the current prodid and taggid from the prodtagg record
		$prodid = $prodtagg->prodid;
		$taggid = $prodtagg->taggid;

		// Get related products (products that are linked to this tagg)
		$relatedProds = $prodtagg->prod->taggs->pluck('id')->toArray();

		// Get related taggs (taggs that are linked to this product)
		$relatedTaggs = $prodtagg->tagg->prods->pluck('id')->toArray();

		return response()->json([
			'message' => "Row to Edit $id",
			'prods' => $prods, // All products available
			'taggs' => $taggs, // All taggs available
			'prodid' => $prodid, // The current product
			'taggid' => $taggid, // The current tagg
			'prodtagg' => $prodtagg, // The prodtagg record
			'id' => $id, // The prodtagg ID
			'relatedProds' => $relatedProds, // IDs of products related to the tagg
			'relatedTaggs' => $relatedTaggs, // IDs of taggs related to the product
		]);
	}


	

	public function storeprodtagsuperadmin(Request $request)
	{
		$this->ensureSuperadmin($request);

		$validated = $request->validate([
			'prodids' => 'required|array|min:1',
			'prodids.*' => 'integer|exists:prods,id',
			'taggids' => 'required|array|min:1',
			'taggids.*' => 'integer|exists:taggs,id',
		]);

		$prodids = $validated['prodids'];
		$taggids = $validated['taggids'];

		$entriesToAdd = [];

		foreach ($prodids as $prodid) {
			$prod = Prod::find($prodid);
			if ($prod) {
				$existingTaggs = $prod->taggs()->pluck('taggid')->toArray();

				foreach ($taggids as $taggid) {
					if (!in_array($taggid, $existingTaggs)) {
						$entriesToAdd[] = [
							'prodid' => $prodid,
							'taggid' => $taggid,
							'created_at' => now(),
							'updated_at' => now(),
						];
					}
				}
			}
		}

		// ✅ Insert only once
		if (!empty($entriesToAdd)) {
			Prodtagg::insert($entriesToAdd);
		}

		return response()->json([
			'message' => 'Product-Tag associations stored successfully.',
			'prods_tagged' => $prodids,
			'tags_attached' => $taggids,
		], 201);
	}



	
	public function updateprodtagsuperadmin(Request $request, $id)
	{
		$this->ensureSuperadmin($request);

		$validated = $request->validate([
			'prodids' => 'required|array|min:1',
			'prodids.*' => 'integer|exists:prods,id',
			'taggids' => 'required|array|min:1',
			'taggids.*' => 'integer|exists:taggs,id',
		]);

		$prodids = $validated['prodids'];
		$taggids = $validated['taggids'];

		// Fetch all relevant products at once
		$products = Prod::whereIn('id', $prodids)->get();

		$synced = [];

		foreach ($products as $prod) {
			// Sync the new tags, removing any that are not part of the new list
			$prod->taggs()->sync($taggids); // Replaces old tags with new tags

			$synced[] = [
				'prodid' => $prod->id,
				'taggids' => $taggids,
			];
		}

		return response()->json([
			'message' => 'Product-tag mappings updated successfully',
			'synced' => $synced,
		]);
	}



/*
	public function storeprodtagsuperadmin(Request $request)
	{
		$this->ensureSuperadmin($request);

		// Validate that prodids and taggids are arrays and not empty
		$validated = $request->validate([
			'prodids' => 'required|array|min:1', // Ensure at least one prodid
			'prodids.*' => 'exists:prods,id',    // Ensure each prodid exists in the prods table
			'taggids' => 'required|array|min:1', // Ensure at least one taggid
			'taggids.*' => 'exists:taggs,id',    // Ensure each taggid exists in the taggs table
		]);

		// Get the arrays of prodids and taggids from the request
		$prodids = $validated['prodids'];
		$taggids = $validated['taggids'];

		// Loop through each combination of prodid and taggid
		$newrecords = [];
		foreach ($prodids as $prodid) {
			foreach ($taggids as $taggid) {
				// Create a new prodtagg record
				$newrecord = new Prodtagg();
				$newrecord->prodid = $prodid;
				$newrecord->taggid = $taggid;

				// Save the new record
				$newrecord->save();

				// Store the new record in the array to return
				$newrecords[] = $newrecord;
			}
		}

		// Return a success response with the newly created records
		return response()->json([
			'message' => 'Product-Tag associations created successfully',
			'newprodtaggs' => $newrecords,
		], 201);
	}

	*/

	/*

	public function storeprodtagsuperadmin(Request $request)
	{
		$this->ensureSuperadmin($request);

		$validated = $request->validate([
			'prodids' => 'required|array|min:1',
			'prodids.*' => 'integer|exists:prods,id',
			'taggids' => 'required|array|min:1',
			'taggids.*' => 'integer|exists:taggs,id',
		]);

		$prodids = $validated['prodids'];
		$taggids = $validated['taggids'];

		// Optional: Prevent duplicate combinations
		$existing = Prodtagg::whereIn('prodid', $prodids)
			->whereIn('taggid', $taggids)
			->get()
			->map(function ($item) {
				return $item->prodid . '_' . $item->taggid;
			})
			->toArray();

		$dataToInsert = [];

		foreach ($prodids as $prodid) {
			foreach ($taggids as $taggid) {
				$comboKey = $prodid . '_' . $taggid;
				if (!in_array($comboKey, $existing)) {
					$dataToInsert[] = [
						'prodid' => $prodid,
						'taggid' => $taggid,
						'created_at' => now(),
						'updated_at' => now(),
					];
				}
			}
		}

		if (!empty($dataToInsert)) {
			Prodtagg::insert($dataToInsert);
		}

		return response()->json([
			'message' => 'Product-Tag associations created successfully',
			'inserted_count' => count($dataToInsert),
		], 201);
	}

	*/


	public function destroyprodtagsuperadmin($id)
    {

        $this->ensureSuperadmin(request());
		$row = Prodtagg::find($id);

        if (!$row) 
		{
            return response()->json(['message' => 'not found'], Response::HTTP_NOT_FOUND);
        }

        $row->delete();

        return response()->json(['message' => ' deleted successfully'], Response::HTTP_OK);
    }
	
		
	public function deleteAllprodtagsuperadmin(Request $request)
	{
		$this->ensureSuperadmin(request());
		$ids = $request->input('prodtaggids');

		if (!is_array($ids) || empty($ids)) {
			return response()->json(['message' => 'Invalid or empty  IDs'], 400);
		}


		$deletedCount = Prodtagg::whereIn('id', $ids)->delete();

		return response()->json([
			'message' => "{$deletedCount} rows) deleted successfully"
		], Response::HTTP_OK);
	}

	

	
	
	
	
}
