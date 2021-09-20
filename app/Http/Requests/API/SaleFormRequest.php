<?php

namespace App\Http\Requests\API;

use App\Http\Requests\API\FormRequest;

class SaleFormRequest extends FormRequest
{

    protected $rules = [];
    protected $messages = [];

    public function rules()
    {
        $this->rules['memo_no']         = ['required','unique:sales,memo_no'];
        $this->rules['sale_date']       = ['required','date','date_format:Y-m-d'];
        $this->rules['route_id']        = ['required'];
        $this->rules['area_id']         = ['required'];
        $this->rules['customer_id']     = ['required'];
        $this->rules['order_discount']  = ['nullable','numeric','gte:0'];
        $this->rules['shipping_cost']   = ['nullable','numeric','gte:0'];
        $this->rules['labor_cost']      = ['nullable','numeric','gte:0'];
        return $this->rules;
    }

    public function messages()
    {
        return $this->messages;
    }

    public function authorize()
    {
        return true;
    }
}
