<?php

namespace Modules\DamageProduct\Http\Controllers;

use Illuminate\Http\Request;
use Modules\Sale\Entities\Sale;
use Illuminate\Routing\Controller;
use App\Http\Controllers\BaseController;
use Illuminate\Contracts\Support\Renderable;

class DamageController extends BaseController
{
    public function index()
    {
        if(permission('damage-access')){
            $this->setPageData('Damage','Damage','fas fa-undo-alt',[['name' => 'Damage']]);
            return view('damageproduct::form');
        }else{
            return $this->access_blocked();
        }
    }

    public function damage_sale(Request $request)
    {
        if(permission('damage-access')){
            $sale = Sale::with(['sale_products','customer:id,name,shop_name','warehouse:id,name','salesmen:id,name,phone','route:id,name','area:id,name'])
            ->where('memo_no',$request->get('memo_no'))->first();

            if($sale){
                $this->setPageData('Damage Product','Damage Product','fas fa-undo-alt',[['name' => 'Damage Product']]);
                $data = [
                    'sale'=>$sale,
                ];
                return view('damageproduct::edit',$data);
            }else{
                return redirect('damage')->with(['status'=>'error','message'=>'No Data Found']);
            }
        }else{
            return $this->access_blocked();
        }
    }
}
