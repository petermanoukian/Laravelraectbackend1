<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Superadmin\SuperadminController;


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
		Route::post('/users/check-email', [SuperadminController::class, 'checkEmail']);

		Route::post('/users/add', [SuperadminController::class, 'store']);
		Route::delete('/userdelete/{id}', [SuperadminController::class, 'destroy']);
		Route::delete('/users/deleteall', [SuperadminController::class, 'deleteAll']);

		
    });
});

