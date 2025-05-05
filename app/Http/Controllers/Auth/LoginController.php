<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Hash;

use App\Models\User;

class LoginController extends Controller
{
 
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        // Check user credentials
        $user = User::where('email', $request->email)->first();

		if ($user && Hash::check($request->password, $user->password)) {
			$token = $user->createToken('login_token')->plainTextToken;

			return response()->json([
				'message' => 'Login successful',
				'token' => $token,
				'user' => [
					'id' => $user->id,
					'email' => $user->email,
					'name' => $user->name,
					'img' => $user->img,
					'role' => $user->getRoleNames()->first() // Spatie returns a collection
				]
			]);
		}

        return response()->json(['message' => 'Invalid credentials'], 401);
    }

	public function logout(Request $request)
	{
		// Revoke the user's current token
		Auth::user()->tokens->each(function ($token) {
			$token->delete();
		});

		return response()->json(['message' => 'Logged out']);
	}
}
