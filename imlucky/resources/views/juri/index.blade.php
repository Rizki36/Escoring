@extends('juri.layouts.master')

@section('title')
    
@endsection

@section('content')
<input type="hidden" name="url_post_one" value="{{ route('juriInput.update_one',['peleton_id'=>$peleton->id]) }}">
<input type="hidden" name="url_post_more" value="{{ route('juriInput.update_more',['peleton_id'=>$peleton->id]) }}">
<div id="kategori-container" class="mt-1 d-flex">
    {{ view('juri._kategori-items',['kategoris'=>$kategoris]) }}
</div>


@foreach ($penilaian as $kategori_id => $kategori)
<form data-id="{{ $kategori_id }}">
<div class="card mt-4 wow fadeIn d-none" data-id="{{ $kategori_id }}">
    <div class="card-body"> 
        <h4 class="card-title text-center">{{ $kategori['nama'] }}</h4>
        <div class="row">
            @foreach ($kategori['subs'] as $sub_id => $sub)
            @foreach ($sub['sub2s'] as $sub2_id => $sub2)
            <div class="col-12">
                <span class="radio-title" data-name="nilai[{{ $kategori_id }}][{{ $sub_id }}][{{ $sub2_id }}]">{{ $sub2['nama'] }}</span>
                <div class="group-radio">
                    @foreach ($sub['kisaran_nilai'] as $kisaran)
                    <div class="custom-radio">
                        <input class="input-radio" autocomplete="off" name="nilai[{{ $kategori_id }}][{{ $sub_id }}][{{ $sub2_id }}]" type="radio" value="{{ $kisaran }}" {{ $sub2['nilai'] == $kisaran ? "checked" : null }}
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
                <button type="submit" class="btn-simpan btn btn-primary w-100">Simpan</button>
            </div>
        </div>
    </div>
</div>
</form>
@endforeach

@endsection

@push('scripts')
    <script>
        const url_post_one  = $("input[name='url_post_one']").val(),
              url_post_more = $("input[name='url_post_more']").val()

        $('body').on('click','.kategori-item',function(e){
            $('.card').addClass('d-none')
            $('.kategori-item').removeClass('kategori-active')
            $(this).addClass('kategori-active')
            const id = $(this).attr('data-id')
            $(`.card[data-id="${id}"]`).removeClass('d-none')
        })

        $('.input-radio').on('change', function () {
            let data = {
                value : $(this).val(),
                id : $(this).attr('data-id'),
            }
            $.ajax({
                type: "PUT",
                url: url_post_one,
                data: data,
                success: function (response) {
                    console.log(response)
                },error:function(e){

                }
            });
        });

        $('.btn-simpan').on('click',function(e){
            e.preventDefault()
            const form      = $(this).closest('form'),
                  inputName = $(form).find('.radio-title')
         
            
            inputName.each(function(){
                let name = $(this).attr('data-name');
                if($(`input[name*='${name}']:checked`).length === 0){
                    $('html, body').animate({
                        scrollTop: $(`input[name*='${name}']`).offset().top - 100
                    }, 2000);
                    throw 'not valid!';
                }
            })
    

            const data = $(this).closest('form').serialize()
            $.ajax({
                type: "PUT",
                url: url_post_more,
                data: data,
                success: function (response) {
                    $('#kategori-container').html(response)
                    $('html, body').animate({
                        scrollTop: $(`body`).offset().top -10
                    }, 2000);
                },error(e){
                    console.log(e)
                }
            });
        })
    </script>
@endpush