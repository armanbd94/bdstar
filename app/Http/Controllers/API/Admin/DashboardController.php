<?php

namespace App\Http\Controllers\API\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\API\APIController;

class DashboardController extends APIController
{
    public function summaryData(Request $request)
    {
        $errors  = [];
        $data    = [];
        $message = "";
        $status  = true;
        $customer_dues = 0;
        $start_date = $request->get('start_date') ? $request->get('start_date') : date('Y-m-d');
        $end_date = $request->get('end_date') ? $request->get('end_date') : date('Y-m-d');
        $sale = DB::table('sales')
                ->select(DB::raw("SUM(grand_total) as sales_amount"),
                DB::raw("SUM(paid_amount) as collection_amount")
                )
                ->whereDate('sale_date','>=',$start_date)
                ->whereDate('sale_date','<=',$end_date)
                ->first();
        $purchase = DB::table('purchases')
                    ->whereDate('purchase_date','>=',$start_date)
                    ->whereDate('purchase_date','<=',$end_date)
                    ->sum('grand_total');
        $sr_commission_due= DB::table('transactions')
            ->select(DB::raw("(SUM(credit) - SUM(debit)) as due_commission"))
            ->where('chart_of_account_id',$coa_id)
            ->whereDate('voucher_date','<=',$end_date)
            ->groupBy('chart_of_account_id')
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
            ->get();
        if(!$customer_dues->isEmpty())
        {
            foreach ($customer_dues->chunk(10) as $chunk) {
                foreach ($chunk as $value)
                {
                    $customer_dues += $value->due_amount;
                }
            }
        }
        dd($start_date,$end_date);
    
    }
}
