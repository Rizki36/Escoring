<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sub2 extends Model
{
    protected $fillable = ['kode','nama','kisaran_nilai','sub_id'];
    
    public function sub()
    {
        return $this->belongsTo(Sub::class);
    }

}
