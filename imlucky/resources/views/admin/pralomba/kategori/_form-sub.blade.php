<form id="form-sub" action="{{ $action }}">

    <div class="form-group">
        <label for="kode">Kode</label>
        <input id="kode" name="kode" type="text" class="form-control" value="{{ $sub->kode ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  

    <div class="form-group">
        <label for="nama">Nama Sub</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $sub->nama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
    
    <div class="form-group">
        <label for="kisaran_nilai">Kisaran Nilai</label>
        <input id="kisaran_nilai" name="kisaran_nilai" type="text" class="form-control" value="{{ $sub2->kisaran_nilai ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
    
</form>