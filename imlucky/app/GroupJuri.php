<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GroupJuri extends Model
{
    public function kategoris()
    {
        return $this->belongsToMany(Kategori::class);
    }
}
