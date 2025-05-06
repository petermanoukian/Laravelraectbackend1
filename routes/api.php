<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Superadmin\SuperadminController;
use App\Http\Controllers\CatController;

// Auth routes
Route::post('/login', [LoginController::class, 'login'])->middleware('api');
Route::post('/logout', [LoginController::class, 'logout'])->middleware('auth:sanctum');

// Protected user route
Route::middleware('auth:sanctum')->group(function () {
    // Return authenticated user with roles
    Route::get('/user', function (Request $request) {
        return $request->user()->load('roles');
    });

    // Superadmin-only routes
    Route::middleware('superadmin')->prefix('superadmin')->group(function () {
        Route::get('/', [SuperadminController::class, 'index']);
        Route::get('/users', [SuperadminController::class, 'getAllUsers']);
		Route::get('/user/edit/{id}', [SuperadminController::class, 'edituser']);
		Route::post('/users/check-email', [SuperadminController::class, 'checkEmail']);
		Route::post('/users/check-email-edit', [SuperAdminController::class, 'checkEmailEdit']);

		Route::post('/users/add', [SuperadminController::class, 'store']);
		Route::put('/users/update/{id}', [SuperadminController::class, 'update']);
		Route::delete('/userdelete/{id}', [SuperadminController::class, 'destroy']);
		Route::delete('/users/deleteall', [SuperadminController::class, 'deleteAll']);
		
		Route::get('/cats', [CatController::class, 'indexsuperadmin']);
		Route::post('/cat/add', [CatController::class, 'storesuperadmin']);
		
    });
	
	Route::middleware('admin')->prefix('admin')->group(function () {
        Route::get('/cats', [CatController::class, 'indexAdmin']);
    });
	
	
});

Route::post('/cats/check-name', [CatController::class, 'checkCat']);
Route::post('/cats/check-name-edit', [CatController::class, 'checkCatEdit']);


