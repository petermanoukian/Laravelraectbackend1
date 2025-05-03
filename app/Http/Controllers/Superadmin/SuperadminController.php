<?php

namespace App\Http\Controllers\Superadmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Http\Response;


class SuperadminController extends Controller
{
    

	
	public function index(Request $request)
    {
        return response()->json([
            'message' => 'Welcome to the Superadmin dashboard!',
            'user' => $request->user()
        ]);
    }
	
	public function getAllUsers(Request $request)
	{
		$perPage = $request->get('per_page', 10); // Default to 10 if not provided
		$sortField = $request->get('sortField', 'id'); // Default to 'id'
		$sortDirection = $request->get('sortDirection', 'desc'); // Default to 'desc'
		$search = $request->get('search', ''); // Get the search query
		$roleFilter = $request->get('role', ''); // Get the role filter

		// Whitelist allowed sortable fields for security
		$allowedSortFields = ['id', 'name', 'email']; // add 'role' if sorting by role name later
		if (!in_array($sortField, $allowedSortFields)) {
			$sortField = 'id';
		}

		// Validate direction
		$sortDirection = strtolower($sortDirection) === 'asc' ? 'asc' : 'desc';

		$users = User::with('roles')
			->when($roleFilter, function($query) use ($roleFilter) {
				// Filter users by role if roleFilter is provided
				$query->whereHas('roles', function($q) use ($roleFilter) {
					$q->where('name', $roleFilter); // Assuming roles have a 'name' field
				});
			})
			->where(function($query) use ($search) {
				if ($search) {
					$query->where('name', 'like', "%{$search}%")
						  ->orWhere('email', 'like', "%{$search}%");
				}
			})
			->orderBy($sortField, $sortDirection)
			->paginate($perPage);

			return response()->json([
				'users' => $users,
				'user' => $request->user(),
				'log_info' => "Fetching users sorted by: $sortField $sortDirection with search: $search",
			]);
	}



	

	public function destroy($id)
    {

        $user = User::find($id);

        if (!$user) 
		{
            return response()->json(['message' => 'User not found'], Response::HTTP_NOT_FOUND);
        }

        if ($user->id === auth()->user()->id) 
		{
            return response()->json(['message' => 'You cannot delete yourself'], Response::HTTP_FORBIDDEN);
        }

        $user->delete();

        return response()->json(['message' => 'User deleted successfully'], Response::HTTP_OK);
    }
	
	
	
	
	
}
