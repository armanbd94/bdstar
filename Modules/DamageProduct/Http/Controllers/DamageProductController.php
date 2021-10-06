<?php

namespace Modules\DamageProduct\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use Modules\DamageProduct\Entities\Damage;
use Illuminate\Contracts\Support\Renderable;

class DamageProductController extends BaseController
{
    public function __construct(Damage $model)
    {
        $this->model = $model;
    }
    
    public function index()
    {
        if(permission('damage-access')){
            $this->setPageData('Damage Product','Damage Product','fas fa-file',[['name' => 'Damage Product']]);
            $data = [
                'salesmen'    => DB::table('salesmen')->where('status',1)->select('name','id','phone')->get(),
                'locations'   => DB::table('locations')->where('status', 1)->get(),
            ];
            return view('damageproduct::index',$data);
        }else{
            return $this->access_blocked();
        }

    }
}
