<?php

namespace App\Http\Controllers\Superadmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SuperadminController extends Controller
{
    
	 public function __construct()
    {
        $this->middleware(['auth:sanctum', 'superadmin']);
    }
	
	
	public function index(Request $request)
    {
        return response()->json([
            'message' => 'Welcome to the Superadmin dashboard!',
            'user' => $request->user()
        ]);
    }
}
