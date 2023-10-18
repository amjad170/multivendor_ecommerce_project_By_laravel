<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Vendor\VendorController;
use App\Http\Controllers\FrontendController;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\Backend\BrandController;
use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\SubCategoryController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });


//Frontend 
Route::controller(FrontendController::class)->group(function () {
    Route::get('/', 'index')->name('frontend.home');
});


// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

// User Dashboard
Route::middleware(['auth', 'verified'])->group(function () {
    Route::controller(UserController::class)->group(function () {
        Route::get('/dashboard', 'user_dashboard')->name('dashboard');
        Route::get('/user/logout', 'userlogout')->name('user.logout');
        Route::post('/user/account/update', 'userAcUpdate')->name('user.account.update');
        Route::get('/user/changePassword', 'userchangePassword')->name('user.change.password');
        Route::post('/user/update/password', 'userpasswordUpdate')->name('user.password.update');
    });
});

// Admin
Route::middleware(['auth', 'role:admin'])->group(function () {

    Route::controller(AdminController::class)->group(function () {
        Route::get('/admin/dashboard', 'admin_dashboard')->name('admin.dashboard');
        Route::get('/admin/logout', 'adminlogout')->name('admin.logout');
        Route::get('/admin/profile', 'adminProfile')->name('admin.profile');
        Route::post('/admin/profile/update', 'adminProfileUpdate')->name('admin.profile.update');
        Route::get('/admin/changePassword', 'adminchangePassword')->name('admin.change.password');
        Route::post('/admin/update/password', 'adminpasswordUpdate')->name('admin.password.update');
    });
});

// Admin Login
Route::controller(AdminController::class)->group(function () {
    Route::get('/admin/login', 'adminlogin')->name('admin.login');
    Route::get('/vendor/inactive', 'inactiveVendor')->name('vendor.inactive');
    Route::get('/vendor/active', 'activeVendor')->name('vendor.active');
    Route::get('/vendor/delete/{id}', 'vendorDelete')->name('vendor.delete');
    Route::get('/vendor/details/{id}', 'detailsVendor')->name('vendor.details');
    Route::post('/vendor/update/{id}', 'updateVendor')->name('vendor.update');
});

// Brand
Route::middleware(['auth', 'role:admin'])->group(function () {
    Route::controller(BrandController::class)->group(function () {
        Route::get('/brand/all', 'index')->name('brand.all');
        Route::get('/brand/add', 'create')->name('brand.add');
        Route::post('/brand/store', 'store')->name('brand.store');
        Route::get('/brand/destroy/{id}', 'destroy')->name('brand.destroy');
        Route::get('/brand/edit/{id}', 'edit')->name('brand.edit');
        Route::post('/brand/update/{id}', 'update')->name('brand.update');
    });
});

// Category
Route::middleware(['auth', 'role:admin'])->group(function () {
    Route::controller(CategoryController::class)->group(function () {
        Route::get('/category/all', 'index')->name('category.all');
        Route::get('/category/add', 'create')->name('category.add');
        Route::post('/category/store', 'store')->name('category.store');
        Route::get('/category/destroy/{id}', 'destroy')->name('category.destroy');
        Route::get('/category/edit/{id}', 'edit')->name('category.edit');
        Route::post('/category/update/{id}', 'update')->name('category.update');
    });
});

// Sub Category
Route::middleware(['auth', 'role:admin'])->group(function () {
    Route::controller(SubCategoryController::class)->group(function () {
        Route::get('/subcategory/all', 'index')->name('subcategory.all');
        Route::get('/subcategory/add', 'create')->name('subcategory.add');
        Route::post('/subcategory/store', 'store')->name('subcategory.store');
        Route::get('/subcategory/destroy/{id}', 'destroy')->name('subcategory.destroy');
        Route::get('/subcategory/edit/{id}', 'edit')->name('subcategory.edit');
        Route::post('/subcategory/update/{id}', 'update')->name('subcategory.update');
    });
});

// Vendor
Route::middleware(['auth', 'role:vendor'])->group(function () {

    Route::controller(VendorController::class)->group(function () {
        Route::get('/vendor/dashboard', 'vendor_dashboard')->name('vendor.dashboard');
        Route::get('/vendor/logout', 'vendorlogout')->name('vendor.logout');
        Route::get('/vendor/profile', 'vendorProfile')->name('vendor.profile');
        Route::post('/vendor/profile/update', 'vendorProfileUpdate')->name('vendor.profile.update');
        Route::get('/vendor/changePassword', 'vendorchangePassword')->name('vendor.change.password');
        Route::post('/vendor/update/password', 'vendorpasswordUpdate')->name('vendor.password.update');
    });
});

// vendor Login
Route::controller(VendorController::class)->group(function () {
    Route::get('/vendor/login', 'vendorLogin')->name('vendor.login');
    Route::get('/vendor/register', 'vendorRegister')->name('vendor.register');
    Route::post('/vendor/store', 'vendorStore')->name('vendor.store');
});


// #################


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';
