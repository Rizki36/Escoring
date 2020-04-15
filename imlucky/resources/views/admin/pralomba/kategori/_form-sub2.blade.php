<form id="form" action="{{ $action }}">

    <div class="form-group">
        <label for="kode">Kode</label>
        <input id="kode" name="kode" type="text" data-inputmask-regex="[a-za-zA-Z0-9][a-za-zA-Z0-9]" class="form-control" value="{{ $sub2->kode ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  

    <div class="form-group">
        <label for="nama">Nama Sub</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $sub2->nama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
    
</form>