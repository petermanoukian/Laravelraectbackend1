<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Superadmin\SuperadminController;
use App\Http\Controllers\CatController;
use App\Http\Controllers\SubcatController;
use App\Http\Controllers\ProdController;

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
		Route::get('/cat/edit/{id}', [CatController::class, 'editsuperadmin']);
		Route::put('/cat/update/{id}', [CatController::class, 'updatesuperadmin']);	
		Route::delete('/cat/delete/{id}', [CatController::class, 'destroysuperadmin']);
		Route::delete('/cats/deleteall', [CatController::class, 'deleteAllsuperadmin']);
		
		
		Route::get('/subcats/view/{catid?}', [SubcatController::class, 'indexsuperadmin']);
		Route::get('/subcat/add/{catid?}', [SubcatController::class, 'addsuperadmin']);
		Route::get('/subcat/edit/{id}/{catid?}', [SubcatController::class, 'editsuperadmin']);
		Route::post('/subcat/add', [SubcatController::class, 'storesuperadmin']);	
		Route::put('/subcat/update/{id}', [SubcatController::class, 'updatesuperadmin']);	
		Route::delete('/subcat/delete/{id}', [SubcatController::class, 'destroysuperadmin']);
		Route::delete('/subcats/deleteall', [SubcatController::class, 'deleteAllsuperadmin']);
		
		
		Route::get('/prods/view/{catid?}/{subid?}', [ProdController::class, 'indexsuperadmin']);
		Route::get('/prod/add/{catid?}/{subid?}', [ProdController::class, 'addsuperadmin']);
		Route::get('/prod/edit/{id}/{catid?}/{subid?}', [ProdController::class, 'editsuperadmin']);
		
		Route::get('/subsbycat/{catid?}', [ProdController::class, 'retrievesubsbycatssupradmin']);
		
		Route::post('/prod/add', [ProdController::class, 'storesuperadmin']);	
		Route::put('/prod/update/{id}', [ProdController::class, 'updatesuperadmin']);	
		Route::delete('/prod/delete/{id}', [ProdController::class, 'destroysuperadmin']);
		Route::delete('/prods/deleteall', [ProdController::class, 'deleteAllsuperadmin']);
		
    });
	
	Route::middleware('admin')->prefix('admin')->group(function () {
        Route::get('/cats', [CatController::class, 'indexAdmin']);
    });
	
	
});

Route::post('/cats/check-name', [CatController::class, 'checkCat']);
Route::post('/cats/check-name-edit', [CatController::class, 'checkCatEdit']);
Route::post('/subcats/check-name', [SubcatController::class, 'checkSub']);
Route::post('/subcats/check-name-edit', [SubcatController::class, 'checkSubEdit']);
Route::post('/prods/check-name', [ProdController::class, 'checkProd']);
Route::post('/prods/check-name-edit', [ProdController::class, 'checkProdEdit']);
