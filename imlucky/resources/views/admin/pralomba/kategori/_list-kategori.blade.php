{{-- jika ada data --}}
@if (!is_null($kategoris))
    @foreach ($kategoris as $kategori) 
        {{-- jika kategori memiliki sub --}}
        @if ($kategori->sub->count()>0)
            @foreach ($kategori->sub as $sub)
                    {{-- jika sub memiliki sub2 --}}
                    @if ($sub->sub2->count() > 0)
                        @foreach ($sub->sub2 as $sub2)
                            <tr class="text-center" style="min-height: 200px">
                                
                                {{-- jika sub2 terletak pada awal sub dan sub2 --}}
                                @if ($loop->parent->first && $loop->first)
                                    @include('admin.pralomba.kategori.table._td-kategori',[
                                            'rowspan'  => $kategori->rowspan,
                                            'kategori' => $kategori->kode,
                                            'nama'     => $kategori->nama])
                                @endif

                                {{-- jika sub2 terletak pada awal sub2 --}}
                                @if ($loop->first)
                                    @include('admin.pralomba.kategori.table._td-sub',[
                                            'nama'     => $sub->nama,
                                            'rowspan'  => $sub->rowspan,
                                            'kategori' => $kategori->kode,
                                            'sub'      => $sub->kode
                                            ])      
                                @endif
                                
                                @include('admin.pralomba.kategori.table._td-sub2',[
                                    'nama'     => $sub2->nama,
                                    'kategori' => $kategori->kode,
                                    'sub'      => $sub->kode,
                                    'sub2'     => $sub2->kode,
                                    'kode'     => $sub2->idsub2
                                ])

                            </tr>
                        @endforeach   

                    {{-- jika sub tidak memiliki sub2 --}}
                    @else
                        <tr class="text-center" style="min-height: 200px">
                            {{-- jika letak sub terletak pada awal kategori --}}
                            @if ($loop->first)
                                @include('admin.pralomba.kategori.table._td-kategori',[
                                        'rowspan'  => $kategori->rowspan,
                                        'kategori' => $kategori->kode,
                                        'nama'     => $kategori->nama])
                            @endif

                            @include('admin.pralomba.kategori.table._td-sub',[
                                    'nama'     => $sub->nama,
                                    'rowspan'  => $sub->rowspan,
                                    'kategori' => $kategori->kode,
                                    'sub'      => $sub->kode,
                                    ])

                            <td class="align-middle">
                                <span class="d-block">Belum ada sub2</span>
                            </td>
                            <td class="align-middle">{{ $kategori->kode.$sub->kode }}</td>
                        </tr>

                    @endif

            @endforeach
        {{-- jika tidak memiliki kategori tidak meiliki sub sama sekali --}}
        @else
            <tr class="text-center">
                @include('admin.pralomba.kategori.table._td-kategori',[
                    'kategori' => $kategori->kode,
                    'nama'     => $kategori->nama,
                    'rowspan'  => 1])
                <td class="align-middle" colspan="2">Belum ada sub</td>
                <td class="align-middle" >{{ $kategori->kode }}</td>
            </tr>
        @endif
    @endforeach 

{{-- jika data tidak ada sama sekali kategori--}}
@else
    <tr>
        <td class="align-middle" colspan="5"> Data masih kosong </td>
    </tr>
@endif