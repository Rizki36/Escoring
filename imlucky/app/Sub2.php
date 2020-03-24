<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sub2 extends Model
{
    protected $fillable = ['kode','nama','sub_id'];
    
    // protected $appends = array('test');

    public function sub()
    {
        return $this->belongsTo(Sub::class,'sub_id','id')->orderBy('kode');
    }

    // public function getTestAttribute()
    // {
    //     // return $this->attributes['kode'];    
    // }


}
