<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sekolah extends Model
{
    public $incrementing = false;
    protected $fillable = ['nama','ballot','pinalti'];

}
