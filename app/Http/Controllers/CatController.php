<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Cat;
use Illuminate\Http\Response;
use Illuminate\Validation\Rule;

class CatController extends Controller
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
	
	
	public function indexsuperadmin(Request $request)
    {
        $this->ensureSuperadmin(request());
		$perPage = $request->get('per_page', 10); // Default to 10 if not provided
		
		$sortField = $request->get('sortField', 'id'); 
		$sortDirection = $request->get('sortDirection', 'desc'); 
		$search = $request->get('search', ''); 
		
	    $allowedSortFields = ['id', 'name']; 
		if (!in_array($sortField, $allowedSortFields)) {
			$sortField = 'id';
		}

		// Validate direction
		$sortDirection = strtolower($sortDirection) === 'asc' ? 'asc' : 'desc';
		
		$cats = Cat::
			where(function($query) use ($search) {
				if ($search) {
					$query->where('name', 'like', "%{$search}%");
				}
			})->
		orderBy($sortField, $sortDirection)->
		paginate($perPage);

		return response()->json([
			'cats' => $cats,
			'log_info' => "Fetching cats",
		]);
    }
	
		public function editsuperadmin(Request $request, $id)
    {
        $this->ensureSuperadmin(request());
		$catedit = Cat::find($id);
		$cateditid = $catedit->id;
		return response()->json([
            'message' => "Row to Edit $cateditid",
            'catedit' => $catedit
        ]);
    }
   
	
	
	
	public function storesuperadmin(Request $request)
	{
		$this->ensureSuperadmin(request());
		
		$validated = $request->validate([
			'name' => 'required|string|max:255',
		]);

		$name = $validated['name'];
		
		$newrecord = new Cat();
		$newrecord->name = $name;
		$newrecord->save();
		return response()->json(['message' => 'Cat created successfully', 'newcat' => $newrecord], 201);
	}


	public function updatesuperadmin(Request $request, $id)
	{
		   
		$this->ensureSuperadmin(request());
	
		
		$cattoupdate = Cat::findOrFail($id);
		$validated = $request->validate([
			'name' => 'required|string|max:255'
		]);

		$cattoupdate->name = $request->name;
		$cattoupdate->save();

		return response()->json([
			'message' => 'updated successfully',
			'cateditted' => $cattoupdate,
		]);
	}

	
	
	public function destroysuperadmin($id)
    {

        $this->ensureSuperadmin(request());
		$row = Cat::find($id);

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
		$catids = $request->input('catids');

		if (!is_array($catids) || empty($catids)) {
			return response()->json(['message' => 'Invalid or empty user IDs'], 400);
		}



		$deletedCount = Cat::whereIn('id', $catids)->delete();

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
	
	
	public function checkCat(Request $request)
	{
		$request->validate([
			'name' => 'required',
		]);

		$exists = Cat::where('name', $request->name)->exists();

		return response()->json(['exists' => $exists]);
	}

	public function checkCatEdit(Request $request)
	{
		$request->validate([
			'name' => 'required',
			'id' => 'required|integer',
		]);

		$exists = Cat::where('name', $request->name)
			->where('id', '!=', $request->id)
			->exists();

		return response()->json(['exists' => $exists]);
	}
	
	
	
	
	
	
	
	
}
