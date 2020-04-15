<form id="form" action="{{ $action }}">

    <div class="form-group">
        <label for="kode">Kode</label>
        <input id="kode" name="kode" type="text" data-inputmask-regex="[a-za-zA-Z0-9]" class="form-control" value="{{ $sub->kode ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  

    <div class="form-group">
        <label for="nama">Nama Sub</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $sub->nama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
    
    <div class="form-group">
        <label for="kisaran_nilai">Kisaran Nilai</label>
        <input id="kisaran_nilai" name="kisaran_nilai" data-inputmask-regex="[a-za-zA-Z0-9,]+(?:\.[a-zA-Z0-9,]+)*" type="text" class="form-control" value="{{ $sub->kisaran_nilai ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>      
    
</form>