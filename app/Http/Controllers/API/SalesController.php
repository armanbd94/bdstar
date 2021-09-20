<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class SalesController extends APIController
{
    public function customer_data(int $id)
    {
        $errors  = [];
        $data    = [];
        $message = "";
        $status  = true;

        $customer_group_data = DB::table('customers as c')
        ->leftJoin('customer_groups as cg','c.customer_group_id','=','cg.id')
        ->selectRaw('cg.percentage')
        ->where('c.id',$id)
        ->first();

        $data['percentage'] = $customer_group_data ? $customer_group_data->percentage : 0;

        $customer_previous_balance = DB::table('transactions as t')
                ->leftjoin('chart_of_accounts as coa','t.chart_of_account_id','=','coa.id')
                ->select(DB::raw("SUM(t.debit) - SUM(t.credit) as balance"),'coa.id','coa.code')
                ->groupBy('t.chart_of_account_id')
                ->where('coa.customer_id',$id)
                ->where('t.approve',1)
                ->first();

        $data['previous_due'] = $customer_previous_balance ? $customer_previous_balance->balance : 0;
        return $this->sendResult($message,$data,$errors,$status);
    }

    public function tax_list()
    {
        $errors  = [];
        $data    = [];
        $message = "";
        $status  = true;

        $taxes = DB::table('taxes')
        ->select('name','rate')
        ->where('status',1)
        ->get();

        if(!$taxes->isEmpty())
        {
            $data = $taxes;
        }else{
            $message = 'No data found!';
            $status = false;
        }
        return $this->sendResult($message,$data,$errors,$status);
    }

    public function account_list(int $payment_method)
    {
        $errors  = [];
        $data    = [];
        $message = "";
        $status  = true;
        $payment_array = [1,2,3];
        if($payment_method)
        {
            if(in_array($payment_method,$payment_array))
            {
                $warehouse_id = auth()->user()->warehouse_id;
                $accounts = DB::table('chart_of_accounts as coa');
                if($payment_method == 1)
                {
                    $accounts = $accounts->select('coa.id','coa.name')->where(['coa.code' =>  '1020101','coa.status'=>1]);
                }elseif ($payment_method == 2) {
                    $accounts = $accounts->leftJoin('banks as b','coa.bank_id','=','b.id')
                    ->select('coa.id','coa.name')
                    ->whereNotNull('coa.bank_id')
                    ->where('coa.status',1)
                    ->where('b.warehouse_id',$warehouse_id);
                }elseif ($payment_method == 3) {
                    $accounts = $accounts->leftJoin('mobile_banks as b','coa.mobile_bank_id','=','b.id')
                    ->select('coa.id','coa.name')
                    ->whereNotNull('coa.mobile_bank_id')
                    ->where('coa.status',1)
                    ->where('b.warehouse_id',$warehouse_id);
                }

                $accounts = $accounts->get();
                if(!$accounts->isEmpty())
                {
                    $data = $accounts;
                }else{
                    $message = 'No data found!';
                    $status = false;
                }
            }else{
                $message = 'Invalid Payment Method!';
                $status = false;
            }
        }else{
            $message = 'Please select payment method!';
            $status = false;
        }
        return $this->sendResult($message,$data,$errors,$status);
    }


}
