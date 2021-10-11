<?php

namespace Modules\Report\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;

class WarehouseSummaryController extends BaseController
{
    public function index()
    {
        if(permission('warehouse-summary-access')){
            $this->setPageData('Warehouse Summary','Warehouse Summary','fas fa-file',[['name' => 'Warehouse Summary']]);
            $warehouses = DB::table('warehouses')->where('status',1)->pluck('name','id');
            return view('report::warehouse-summary-report.index',compact('warehouses'));
        }else{
            return $this->access_blocked();
        }
    }

    public function summary_data(Request $request)
    {
        if($request->ajax())
        {

            $warehouse_id = $request->warehouse_id;
            $start_date = $request->start_date;
            $end_date   = $request->end_date;

            
            $material_purchase_data = DB::table('purchases')
                                ->select(DB::raw("SUM(grand_total) as material_purchase_grand_value"))
                                ->whereDate('purchase_date','>=',$start_date)
                                ->whereDate('purchase_date','<=',$end_date)
                                ->first();

            $product_sale_data = DB::table('sales')
                                ->select(DB::raw("SUM(grand_total) as product_sales_grand_value"),
                                DB::raw("SUM(paid_amount) as sales_collection_received_value"),
                                DB::raw("SUM(due_amount) as product_sales_due_value"),
                                DB::raw("SUM(order_discount) as customer_discount_grand_value")
                                )
                                ->where('warehouse_id',$warehouse_id)
                                ->whereDate('sale_date','>=',$start_date)
                                ->whereDate('sale_date','<=',$end_date)
                                ->groupBy('warehouse_id')
                                ->first();

            $total_due_grand_values = DB::table('sales')
            ->selectRaw('customer_id,due_amount,max(id) as last_due_id')
            ->groupBy('customer_id')
            ->where([['warehouse_id',$warehouse_id],['due_amount','>',0]])
            ->whereDate('sale_date','>=',$start_date)
            ->whereDate('sale_date','<=',$end_date)
            ->get();
            
            $total_damage_value = DB::table('sale_returns')
                                ->where('warehouse_id',$warehouse_id)
                                ->whereDate('return_date','>=',$start_date)
                                ->whereDate('return_date','<=',$end_date)
                                ->sum('grand_total');


            $warehouse_expense = DB::table('expenses')
                                ->where('warehouse_id',$warehouse_id)
                                ->whereDate('date','>=',$start_date)
                                ->whereDate('date','<=',$end_date)
                                ->sum('amount');

            $data = [
                'material_purchase_data' => $material_purchase_data,
                'product_sale_data' => $product_sale_data,
                'total_damage_value' => $total_damage_value,
                'warehouse_expense' => $warehouse_expense,
                'total_due_grand_values' => $total_due_grand_values
            ];
            // dd($data);
            return view('report::warehouse-summary-report.summary-data',$data)->render();
        }
    }
}
