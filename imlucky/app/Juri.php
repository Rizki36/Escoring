<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Juri extends Model
{
    protected $fillable = ['group_juri_id','kode','nama','password'];
    public function group_juri()
    {
        return $this->belongsTo(GroupJuri::class);
    }
}
