<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

use App\Models\Prod;
use App\Models\Tagg;
use App\Models\Prodtagg;
use Illuminate\Http\Response;
use Illuminate\Validation\Rule;

class TaggController extends Controller
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
		$perPage = $request->get('per_page', 5); // Default to 10 if not provided
		
		$sortField = $request->get('sortField', 'id'); 
		$sortDirection = $request->get('sortDirection', 'desc'); 
		$search = $request->get('search', ''); 
		
	    $allowedSortFields = ['id', 'name']; 
		if (!in_array($sortField, $allowedSortFields)) {
			$sortField = 'id';
		}

		// Validate direction
		$sortDirection = strtolower($sortDirection) === 'asc' ? 'asc' : 'desc';
		//withCount('taggprods')->
		$taggs = Tagg::
			where(function($query) use ($search) {
				if ($search) {
					$query->where('name', 'like', "%{$search}%");
				}
			})->
		orderBy($sortField, $sortDirection)->
		paginate($perPage);

		return response()->json([
			'taggs' => $taggs,
			'log_info' => "Fetching tags",
		]);
    }
	
	public function editsuperadmin(Request $request, $id)
    {
        $this->ensureSuperadmin(request());
		$rowedit = Tagg::find($id);
		$roweditid = $rowedit->id;
		return response()->json([
            'message' => "Row to Edit $roweditid",
            'rowedit' => $rowedit
        ]);
    }
	
	public function storesuperadmin(Request $request)
	{
		$this->ensureSuperadmin(request());
		
		$validated = $request->validate([
			'name' => 'required|string|max:255',
		]);
		$name = $validated['name'];	
		$newrecord = new Tagg();
		$newrecord->name = $name;
		$newrecord->save();
		return response()->json(['message' => 'Tagg created successfully', 'newtagg' => $newrecord], 201);
	}


	public function updatesuperadmin(Request $request, $id)
	{	   
		$this->ensureSuperadmin(request());	
		$row = Tagg::findOrFail($id);
		$validated = $request->validate([
			'name' => 'required|string|max:255'
		]);

		$row->name = $request->name;
		$row->save();

		return response()->json([
			'message' => 'updated successfully',
			'updated' => $row,
		]);
	}

	public function destroysuperadmin($id)
    {

        $this->ensureSuperadmin(request());
		$row = Tagg::find($id);

        if (!$row) 
		{
            return response()->json(['message' => 'not found'], Response::HTTP_NOT_FOUND);
        }

		//$row->taggprods()->delete();
        $row->delete();

        return response()->json(['message' => ' deleted successfully'], Response::HTTP_OK);
    }
	
		
	public function deleteAllsuperadmin(Request $request)
	{
		$this->ensureSuperadmin(request());
		$ids = $request->input('ids');

		if (!is_array($ids) || empty($ids)) {
			return response()->json(['message' => 'Invalid or empty user IDs'], 400);
		}



		//Taggprod::whereIn('taggid', $ids)->delete();
		$deletedCount = Tagg::whereIn('id', $ids)->delete();

		return response()->json([
			'message' => "{$deletedCount} rows) deleted successfully"
		], Response::HTTP_OK);
	}

	public function checkTagg(Request $request)
	{
		$request->validate([
			'name' => 'required',
		]);

		$exists = Tagg::where('name', $request->name)->exists();

		return response()->json(['exists' => $exists]);
	}

	public function checkTaggEdit(Request $request)
	{
		$request->validate([
			'name' => 'required',
			'id' => 'required|integer',
		]);

		$exists = Tagg::where('name', $request->name)
			->where('id', '!=', $request->id)
			->exists();

		return response()->json(['exists' => $exists]);
	}

}
