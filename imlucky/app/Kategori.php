<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kategori extends Model
{
    protected $fillable = ['kode','nama'];

    public function sub()
    {
        return $this->hasMany(Sub::class);
    }    
}
