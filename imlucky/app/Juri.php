<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Juri extends Model
{
    protected $primaryKey = 'kode';
    public $incrementing = false;
    protected $fillable = ['kode','nama','password'];
}
