@extends('juri.layouts.master')

@section('title')
    
@endsection

@section('content')
<input type="hidden" name="url_post_one" value="{{ route('juriInput.update_one',['peleton_id'=>$peleton->id]) }}">
<input type="hidden" name="url_post_more" value="{{ route('juriInput.update_more',['peleton_id'=>$peleton->id]) }}">
<div id="kategori-container" class="mt-1 d-flex">
    @foreach ($kategoris as $kategori)
    <a class="btn kategori-item" data-id="{{ $kategori->id }}">
        {{ $kategori->nama }}
    </a>
    @endforeach
</div>

@foreach ($penilaian as $kategori_id => $kategori)
<div class="card mt-4 wow fadeIn">
    <div class="card-body"> 
        <h4 class="card-title text-center">{{ $kategori['nama'] }}</h4>
        <div class="row">
            @foreach ($kategori['subs'] as $sub_id => $sub)
            @foreach ($sub['sub2s'] as $sub2_id => $sub2)
            <div class="col-12">
                <span class="radio-title">{{ $sub2['nama'] }}</span>
                <div class="group-radio">
                    @foreach ($sub['kisaran_nilai'] as $kisaran)
                    <div class="custom-radio">
                        <input class="input-radio" name="nilai[{{ $kategori_id }}][{{ $sub_id }}][{{ $sub2_id }}]" type="radio" value="{{ $kisaran }}" {{ $sub2['nilai'] == $kisaran ? "checked" : null }}
                        data-id="{{ $kategori_id }},{{ $sub_id }},{{ $sub2_id }}">
                        <label for="nilai">{{ $kisaran }}</label>
                    </div>
                    @endforeach
                </div>
                <hr>
            </div>
            @endforeach
            @endforeach
            <div class="col-12">
                <button class="btn btn-primary w-100">Simpan</button>
            </div>
        </div>
    </div>
</div>
@endforeach

@endsection

@push('scripts')
    <script>
        const url_post_one  = $("input[name='url_post_one']").val(),
              url_post_more = $("input[name='url_post_more']").val()
        $('.input-radio').on('change', function () {
            let data = {
                value : $(this).val(),
                id : $(this).attr('data-id'),
            }
            $.ajax({
                type: "POST",
                url: url_post_one,
                data: data,
                success: function (response) {
                    console.log(response)
                }
            });
        });
    </script>
@endpush