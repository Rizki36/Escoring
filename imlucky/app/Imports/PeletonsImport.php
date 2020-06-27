<?php

namespace App\Imports;

use App\Peleton;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Imports\HeadingRowFormatter;
HeadingRowFormatter::default('none');

class PeletonsImport implements ToModel,WithHeadingRow
{
    
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Peleton([
            'no' => $row['NO'],
            'nama' => $row['NAMA'],
            'ballot' => 0,
            'pinalti' => 0
        ]);
    }
}
