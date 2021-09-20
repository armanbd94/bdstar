<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\API\APIController;

class ProductSearchController extends APIController
{
    public function search_product(Request $request)
    {
        $errors  = [];
        $data    = [];
        $message = "";
        $status  = true;
        $search_text = $request->get('product');

        if($search_text)
        {
            $products = DB::table('warehouse_product as wp')
            ->join('products as p','wp.product_id','=','p.id')
            ->selectRaw('p.id,p.name')
            ->where([['wp.warehouse_id',auth()->user()->warehouse_id],['wp.qty','>',0]])
            ->where(function($q) use ($search_text){
                $q->where('name','like','%'.$search_text.'%')
                ->orWhere('code','like','%'.$search_text.'%');
            })
            ->orderBy('p.name','asc')
            ->get();
            
            if(!$products->isEmpty())
            {
                foreach($products as $row)
                {
                    $temp_array = array();
                    $temp_array['id']       = $row->id;
                    $temp_array['name']     = $row->name;
                    $data[] = $temp_array;
                }
            }else{
                $message = 'No data found!';
                $status = false;
            }
        }else{
            $message = 'Please enter product name!';
            $status = false;
        }
        return $this->sendResult($message,$data,$errors,$status);
    }

    public function product_data(int $id)
    {
        $errors  = [];
        $data    = [];
        $message = "";
        $status  = true;

        $product = DB::table('warehouse_product as wp')
        ->join('products as p','wp.product_id','=','p.id')
        ->leftjoin('taxes as t','p.tax_id','=','t.id')
        ->where([
            ['wp.warehouse_id',auth()->user()->warehouse_id],
            ['wp.product_id',$id]
        ])
        ->selectRaw('wp.*,p.name,p.code,p.base_unit_id,p.base_unit_price as price,p.tax_method,t.name as tax_name,t.rate as tax_rate')
        ->first();

        if($product)
        {
            $data['id']         = $product->product_id;
            $data['name']       = $product->name;
            $data['code']       = $product->code;
            $data['price']      = $product->price;
            $data['stock_qty']  = $product->qty;
            $data['tax_name']   = $product->tax_name ?? 'No Tax';
            $data['tax_rate']   = $product->tax_rate ?? 0;
            $data['tax_method'] = $product->tax_method;//1=Exclude,2=Include
        }else{
            $message = 'No data found!';
            $status = false;
        }
        return $this->sendResult($message,$data,$errors,$status);
    }
}
