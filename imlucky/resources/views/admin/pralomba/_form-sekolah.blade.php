<form id="form-sekolah" action="{{ $action }}">
    <div class="form-group">
        <label for="id">Nomer Urut</label>
        <input id="id" name="id" type="number" class="form-control" value="{{ $sekolah->id ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  

    <div class="form-group">
        <label for="nama">Nama Pleton</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $sekolah->nama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
</form>