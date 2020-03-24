<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sub extends Model
{
    protected $fillable = ['kode','nama','kisaran_nilai','kategori_id'];

    public function kategori()
    {
        return $this->belongsTo(Kategori::class)->orderBy('kode');
    }

    public function sub2()
    {
        return $this->hasMany(Sub2::class)->orderBy('kode');
    }
}
