<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;

// Auth routes
Route::post('/login', [LoginController::class, 'login'])->middleware('api');
Route::post('/logout', [LoginController::class, 'logout'])->middleware('auth:sanctum');

// Protected user route
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::middleware(['auth:sanctum', 'superadmin'])->group(function () {
    Route::get('/superadmin', [SuperadminController::class, 'index']);
});
