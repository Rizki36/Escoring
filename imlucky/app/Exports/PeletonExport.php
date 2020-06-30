<?php

namespace App\Exports;

use App\Peleton;
use Maatwebsite\Excel\Concerns\FromCollection;

class PeletonExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Peleton::all(['no','nama']);
    }
}
