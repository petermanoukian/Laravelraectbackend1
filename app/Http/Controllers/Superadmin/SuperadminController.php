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

		$users = User::with('roles')->orderby('id', 'desc')->paginate($perPage);

		return response()->json([
			'users' => $users,
			'user' => $request->user()
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
