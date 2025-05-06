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
		$cats = Cat::orderBy('name', 'asc')->paginate($perPage);

		return response()->json([
			'cats' => $cats,
			'log_info' => "Fetching cats",
		]);
    }
   
	
	public function store(Request $request)
	{
		$this->ensureSuperadmin(request());
		
		$validated = $request->validate([
			'name' => 'required|string|max:255',
			'email' => 'required|email|unique:users,email',
			'password' => 'required|string|min:6',
			'role' => 'required|in:superadmin,admin,user',
			'img' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:9320',
			'pdf' => 'nullable|file|mimes:pdf,doc,docx,txt,jpeg,jpg,png|max:9320',
		]);

		// Create a random suffix for uniqueness
		$randomSuffixImg = Str::random(7);  // For image
		$randomSuffixPdf = Str::random(7);  // For PDF (or other file)

		// Generate user name with a random suffix
		$generatedName = $validated['name'] . '-' . Str::random(7);
		$name = $validated['name'];
		
		$newuser = new User();
		$newuser->name = $name;
		$newuser->email = $validated['email'];
		$newuser->password = Hash::make($validated['password']);
		
		$newuser->save();


		if ($request->hasFile('img')) {
			$imgExtension = $request->file('img')->getClientOriginalExtension();
			$imgName = $generatedName . '-' . $randomSuffixImg . '.' . $imgExtension;
			$imgPath = $request->file('img')->move(public_path('users/img'), $imgName);
			$newuser->img = 'users/img/' . $imgName;  // Save the relative path
		}


		if ($request->hasFile('pdf')) {
			$pdfExtension = $request->file('pdf')->getClientOriginalExtension();
			$pdfName = $generatedName . '-' . $randomSuffixPdf . '.' . $pdfExtension;
			$pdfPath = $request->file('pdf')->move(public_path('users/pdf'), $pdfName);
			$newuser->pdf = 'users/pdf/' . $pdfName;  // Save the relative path
		}
		$role = $validated['role'];
		$newuser->save();
		$newuser->assignRole($role);  // Assign role using Spatie's assignRole method
		return response()->json(['message' => 'User created successfully', 'newuser' => $newuser], 201);
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
