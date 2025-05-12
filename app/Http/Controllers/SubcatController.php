<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


use App\Models\User;
use App\Models\Cat;
use App\Models\Subcat;
use App\Models\Prod;
use Illuminate\Http\Response;
use Illuminate\Validation\Rule;

class SubcatController extends Controller
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
	
	
	public function indexsuperadmin(Request $request, $catid = '')
    {
        $this->ensureSuperadmin(request());
		$perPage = $request->get('per_page', 5); // Default to 10 if not provided
		
		$sortField = $request->get('sortField', 'id'); 
		$sortDirection = $request->get('sortDirection', 'desc'); 
		$search = $request->get('search', ''); 
		
	    $allowedSortFields = ['id', 'name', 'catid']; 
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
			
		
		$cats = Cat::orderBy("name", 'asc')->get();
		
		$subcats = Subcat::with('cat')->withCount('subprods')->
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
			orderBy($sortField, $sortDirection)->
			paginate($perPage);

		return response()->json([
			'cats' => $cats,
			'subcats' => $subcats,
			'category_name' => $categoryName,
			'log_info' => "Fetching cats and subcats",
		]);
    }
	
	
	public function addsuperadmin(Request $request,  $catid='')
    {
        $this->ensureSuperadmin(request());
	
		$cats = Cat::orderBy("name", 'asc')->get();
				$categoryName = null;
				
		$categoryName = '';		
		
		if ($catid) {
			$category = Cat::find($catid);
			$categoryName = $category ? $category->name : null;
		}
		
		
		return response()->json([
            'message' => "Row to Add ", 'category_name' => $categoryName,
            'cats' => $cats, 'catid' => $catid
        ]);
    }
	
	public function editsuperadmin(Request $request, $id, $catid='')
    {
        $this->ensureSuperadmin(request());
		$sub = Subcat::find($id);
		$cats = Cat::orderBy("name", 'asc')->get();
		$subid = $sub->id;
		$catid = $sub->catid;
		return response()->json([
            'message' => "Row to Edit $id",
            'sub' => $sub , 'cats' => $cats, 'catid' => $catid, 'id' => $id
        ]);
    }
   
	
	
	
	public function storesuperadmin(Request $request)
	{
		$this->ensureSuperadmin(request());	
		$validated = $request->validate([
			'name' => [
				'required',
				'string',
				'max:255',
				Rule::unique('subcats')->where(function ($query) use ($request) {
					return $query->where('catid', $request->catid);
				}),
			],
			'catid' => 'required|numeric|exists:cats,id',
		]);
		$name = $validated['name'];
		$catid = $validated['catid'];
		$newrecord = new Subcat();
		$newrecord->name = $name;
		$newrecord->catid = $catid;
		$newrecord->save();
		return response()->json(['message' => 'SubCat created successfully', 'newcat' => $newrecord], 201);
	}


	public function updatesuperadmin(Request $request, $id)
	{   
		$this->ensureSuperadmin($request);
		$sub = Subcat::with('cat')->findOrFail($id);
		$validated = $request->validate([
			'name' => [
				'required',
				'string',
				'max:255',
				Rule::unique('subcats')->where(function ($query) use ($request) {
					return $query->where('catid', $request->catid);
				})->ignore($id),
			],
			'catid' => 'required|numeric|exists:cats,id',
		]);
		$name = $validated['name'];
		$catid = $validated['catid'];
		$sub->name = $name;
		$sub->catid = $catid;
		$sub->save();
		return response()->json([
			'message' => 'User updated successfully',
			'editted' => $sub,
		]);
	}
	
		
	public function checkSubCat(Request $request)
	{
		$request->validate([
			'name' => 'required',
			'catid' => 'required|integer',
		]);

		$exists = Subcat::where('name', $request->name)->where('catid', $request->catid)->exists();

		return response()->json(['exists' => $exists]);
	}

	public function checkSubCatEdit(Request $request)
	{
		$request->validate([
			'name' => 'required',
			'catid' => 'required|integer',
			'id' => 'required|integer',
		]);

		$exists = Subcat::where('name', $request->name)
			->where('catid', $request->catid)
			->where('id', '!=', $request->id)
			->exists();

		return response()->json(['exists' => $exists]);
	}

	
	
	public function destroysuperadmin($id)
    {

        $this->ensureSuperadmin(request());
		$row = Subcat::find($id);

        if (!$row) 
		{
            return response()->json(['message' => 'not found'], Response::HTTP_NOT_FOUND);
        }
		$row->subprods()->delete();
        $row->delete();

        return response()->json(['message' => ' deleted successfully'], Response::HTTP_OK);
    }
	
		
	public function deleteAllsuperadmin(Request $request)
	{
		$this->ensureSuperadmin(request());
		$subids = $request->input('subids');

		if (!is_array($subids) || empty($subids)) {
			return response()->json(['message' => 'Invalid or empty user IDs'], 400);
		}
		
		Prod::whereIn('subid', $subids)->delete();
		$deletedCount = Subcat::whereIn('id', $subids)->delete();

		return response()->json([
			'message' => "{$deletedCount} rows) deleted successfully"
		], Response::HTTP_OK);
	}

	public function indexadmin(Request $request)
    {
        $this->ensureAdmin(request());
		$perPage = $request->get('per_page', 10); // Default to 10 if not provided

		$cats = cat::orderBy('name', 'asc')
			->paginate($perPage);
			return response()->json([
				'cats' => $cats,
				'log_info' => "Fetching cats",
			]);
    }
	
	
	
	public function checkSub(Request $request)
	{
		$request->validate([
			'name' => 'required',
			'catid' => 'required|integer',
		]);
		$exists = Subcat::where('name', $request->name)->where('catid', '=', $request->catid)->exists();
		return response()->json(['exists' => $exists]);
	}

	public function checkSubEdit(Request $request)
	{
		$request->validate([
			'name' => 'required',
			'catid' => 'required|integer',
			'id' => 'required|integer',
		]);
		$exists = Subcat::where('name', $request->name)->where('catid', '=', $request->catid)
			->where('id', '!=', $request->id)
			->exists();
		return response()->json(['exists' => $exists]);
	}
	
	
	
	

	
}
