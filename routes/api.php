<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('salesmen/login', 'API\SalesmenLoginController@login');

Route::group(['prefix' => 'salesmen','middleware' => ['jwt.verify']],function ()
{

    Route::get('daily-route-list/{salesmen_id}', 'API\SalesmenController@daily_route_list');
    Route::get('area-list/{route_id}', 'API\SalesmenController@route_area_list');
    Route::get('customer-list/{area_id}', 'API\SalesmenController@area_customer_list');
    Route::get('customer/{id}', 'API\SalesController@customer_data');
    Route::get('search', 'API\ProductSearchController@search_product');
    Route::get('product/{id}', 'API\ProductSearchController@product_data');
    Route::get('tax-list', 'API\SalesController@tax_list');
    Route::get('payment-account-list/{payment_method}', 'API\SalesController@account_list');
    Route::post('store-sale-data', 'API\SalesController@store_sale_data');
    Route::get('sales-list', 'API\SalesController@sales_list');
    Route::get('sale/{id}/view', 'API\SalesController@sale_view');
    Route::post('change-password', 'API\SalesmenPasswordChangeController@change_password');
});
