<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kategori extends Model
{
    protected $fillable = ['kode','nama','bobot_umum','bobot_utama'];

    public function sub()
    {
        return $this->hasMany(Sub::class)->orderBy('kode');
    }    

    public function groupJuri()
    {
        return $this->belongsToMany(GroupJuri::class);
    }
    
}
