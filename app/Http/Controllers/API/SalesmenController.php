<?php

namespace App\Http\Controllers\API;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\API\APIController;
use Modules\SalesMen\Entities\SalesMenDailyRoute;

class SalesmenController extends APIController
{

    public function customer_list(Request $request)
    {
        $errors    = [];
        $data    = [];
        $message = "";
        $status  = true;
        try {
            
            $search_text = $request->customer;
            $salesman_routes = DB::table('sales_men_daily_routes')->where('salesmen_id',auth()->user()->id)->select('route_id')->get();
            $routes = [];
            if(!$salesman_routes->isEmpty())
            {
                foreach ($salesman_routes as $value) {
                    array_push($routes,$value->route_id);
                }
                $customers = DB::table('customers as c')
                ->leftJoin('customer_groups as cg','c.customer_group_id','=','cg.id')
                ->select('c.id','c.name','c.shop_name','cg.percentage')
                ->where('c.status',1)
                ->whereIn('c.route_id',$routes)
                ->when($search_text,function($q) use ($search_text){
                    $q->where('c.name','like','%'.$search_text.'%')
                    ->orWhere('c.shop_name','like','%'.$search_text.'%');
                })
                ->get();
                if($customers){
                    foreach ($customers as $value) {
                        $customer_previous_balance = DB::table('transactions as t')
                        ->leftjoin('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
                        ->select(DB::raw("SUM(t.debit) - SUM(t.credit) as balance"),'coa.id','coa.code')
                        ->groupBy('t.chart_of_account_id')
                        ->where('coa.customer_id',$value->id)
                        ->where('t.approve',1)
                        ->first();
                        $data[] = [
                            'id'           => $value->id,
                            'name'         => $value->shop_name.' ('.$value->name.')',
                            'percentage'   => $value->percentage ? number_format($value->percentage,2,'.','') : number_format(0,2,'.',''),
                            'previous_due' => $customer_previous_balance ? number_format($customer_previous_balance->balance,2,'.','') : number_format(0,2,'.','')
                        ];
                    }
                    $message = "Data found Successfully";
                }else{
                    $status  = false;
                    $message = "No Records Found";
                }
            }else{
                $status  = false;
                $message = "No Records Found";
            }
            
        } catch (Exception $e) {
            $status  = false;
            $message = $e->getMessage();
        }
        return $this->sendResult($message,$data,$errors,$status);
    }

}
