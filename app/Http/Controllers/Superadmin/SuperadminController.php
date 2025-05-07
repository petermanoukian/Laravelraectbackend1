<?php

namespace App\Http\Controllers\Superadmin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Response;
use Illuminate\Validation\Rule;

class SuperadminController extends Controller
{
    
	protected function ensureSuperadmin(Request $request)
	{
		if (!$request->user() || !$request->user()->hasRole('superadmin')) {
			abort(403, 'Forbidden. Superadmin only.');
		}
	}

	
	public function index(Request $request)
    {
        $this->ensureSuperadmin(request());
		return response()->json([
            'message' => 'Welcome to the Superadmin dashboard!',
            'user' => $request->user()
        ]);
    }
	
	
	
	public function edituser(Request $request, $id)
    {
        $this->ensureSuperadmin(request());
		$useredit = User::with('roles')->find($id);
		$usereditid = $useredit->id;
		return response()->json([
            'message' => "User to Edit $usereditid",
            'useredit' => $useredit
        ]);
    }
	

	
	public function getAllUsers(Request $request)
	{
		$this->ensureSuperadmin(request());
		$perPage = $request->get('per_page', 10); 
		$sortField = $request->get('sortField', 'id'); 
		$sortDirection = $request->get('sortDirection', 'desc'); 
		$search = $request->get('search', ''); 
		$roleFilter = $request->get('role', ''); 

		$allowedSortFields = ['id', 'name', 'email']; // add 'role' if sorting by role name later
		if (!in_array($sortField, $allowedSortFields)) {
			$sortField = 'id';
		}

		$sortDirection = strtolower($sortDirection) === 'asc' ? 'asc' : 'desc';

		$users = User::with('roles')
			->when($roleFilter, function($query) use ($roleFilter) {
				$query->whereHas('roles', function($q) use ($roleFilter) {
					$q->where('name', $roleFilter);
				});
			})
			->where(function($query) use ($search) {
				if ($search) {
					$query->where('name', 'like', "%{$search}%")
						  ->orWhere('email', 'like', "%{$search}%");
				}
			})
			//->whereRaw('1 = 2') 
			->orderBy($sortField, $sortDirection)
			->paginate($perPage);

			return response()->json([
				'users' => $users,
				'user' => $request->user(),
				'log_info' => "Fetching users sorted by: $sortField $sortDirection with search: $search",
			]);
	}


	public function checkEmail(Request $request)
	{
		$request->validate([
			'email' => 'required|email',
		]);

		$exists = User::where('email', $request->email)->exists();

		return response()->json(['exists' => $exists]);
	}

	public function checkEmailEdit(Request $request)
	{
		$request->validate([
			'email' => 'required|email',
			'user_id' => 'required|integer',
		]);

		$exists = User::where('email', $request->email)
			->where('id', '!=', $request->user_id)
			->exists();

		return response()->json(['exists' => $exists]);
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


	public function update(Request $request, $id)
	{
		   
		$this->ensureSuperadmin(request());
	
		
		$newuser = User::findOrFail($id);
		$validated = $request->validate([
			'name' => 'required|string|max:255',
			 'email' => [
				'required',
				'email',
				Rule::unique('users', 'email')->ignore($newuser->id),
			],
			'role' => 'required|in:superadmin,admin,user',
			'img' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:9320',
			'pdf' => 'nullable|file|mimes:pdf,doc,docx,txt,jpeg,jpg,png|max:9320',
		]);

		
		$randomSuffixImg = Str::random(7);  
		$randomSuffixPdf = Str::random(7);  

		$generatedName = $validated['name'] . '-' . Str::random(7);
		$newuser->name = $request->name;
		$newuser->email = $request->email;

		if ($request->filled('password')) {
			$newuser->password = bcrypt($request->password);
		}

		
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

		$newuser->save();
		$newuser->syncRoles([$request->role]);

		return response()->json([
			'message' => 'User updated successfully',
			'usereditted' => $newuser->load('roles'),
		]);
	}




	public function destroy($id)
    {

        $this->ensureSuperadmin(request());
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
	
		
	public function deleteAll(Request $request)
	{
		$this->ensureSuperadmin(request());
		$userIds = $request->input('user_ids');

		if (!is_array($userIds) || empty($userIds)) {
			return response()->json(['message' => 'Invalid or empty user IDs'], 400);
		}

		$authUserId = auth()->id();

		if (in_array($authUserId, $userIds)) {
			return response()->json(['message' => 'You cannot delete yourself'], Response::HTTP_FORBIDDEN);
		}

		$deletedCount = User::whereIn('id', $userIds)->delete();

		return response()->json([
			'message' => "{$deletedCount} user(s) deleted successfully"
		], Response::HTTP_OK);
	}


	
	
}
