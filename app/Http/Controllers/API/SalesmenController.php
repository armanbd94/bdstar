<?php

namespace App\Http\Controllers\API;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\SalesMen\Entities\Salesmen;
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

    public function salesmen_data_summary(Request $request){
        $errors    = [];
        $data    = [];
        $message = "";
        $status  = true;
        try {            
            $salesmen_id = auth()->user()->id;
            $coa_id = auth()->user()->coa->id;
            if($request->start_date == null && $request->end_date == null){
                $start_date = date('Y-m-01');
                $end_date   = date('Y-m-31');
            }else{                
                $start_date = $request->start_date;
                $end_date   = $request->end_date;
            }            
            $product_sale_data= DB::table('sales')
                                ->select(DB::raw("SUM(grand_total) as sales_amount"),
                                DB::raw("SUM(paid_amount) as collection_amount"),
                                DB::raw("SUM(total_commission) as sr_commission")
                                )
                                ->where('salesmen_id',$salesmen_id)
                                ->whereDate('sale_date','>=',$start_date)
                                ->whereDate('sale_date','<=',$end_date)
                                ->groupBy('salesmen_id')
                                ->first();

            $customer_dues = DB::table('sales as s')
                ->leftJoin('customers as c','s.customer_id','=','c.id')
                    ->selectRaw('s.customer_id,s.due_amount,max(s.id) as last_due_id')
                    ->groupBy('s.customer_id')
                    ->where('s.due_amount','>',0)
                    ->when($start_date,function($q) use($start_date){
                        $q->whereDate('s.sale_date','>=',$start_date);
                    })
                    ->when($end_date,function($q) use($end_date){
                        $q->whereDate('s.sale_date','<=',$end_date);
                    })
                    ->when($salesmen_id,function($q) use($salesmen_id){
                        $q->where('s.salesmen_id',$salesmen_id);
                    })
                    ->get();
                $total_dues = 0;
                if($customer_dues)
                {
                    foreach ($customer_dues->chunk(10) as $chunk) {
                        foreach ($chunk as $value)
                        {
                            $total_dues += $value->due_amount;
                        }
                    }
                }
                $sr_commission_data= DB::table('transactions')
                                    ->select(DB::raw("SUM(debit) as commissin_paid"),
                                    DB::raw("SUM(credit) as commissin_unpaid"),
                                    DB::raw("(SUM(credit) - SUM(debit)) as due_commission")
                                    )
                                    ->where('chart_of_account_id',$coa_id)
                                    ->whereDate('voucher_date','>=',$start_date)
                                    ->whereDate('voucher_date','<=',$end_date)
                                    ->groupBy('chart_of_account_id')
                                    ->first();

                $data['sales_amount']  = $product_sale_data->sales_amount;
                $data['collection_amount']  = $product_sale_data->collection_amount;
                $data['sr_commission']  = $product_sale_data->sr_commission;
                $data['due_amount']  = $total_dues;
                $data['commission_paid']  = $sr_commission_data->commissin_paid;
                $data['due_commission']  = $sr_commission_data->due_commission;
            
        } catch (Exception $e) {
            $status  = false;
            $message = $e->getMessage();
        }
        return $this->sendResult($message,$data,$errors,$status);

    }

}
