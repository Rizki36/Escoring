<form id="form-peleton" action="{{ $action }}">
    <div class="form-group">
        <label for="no">Nomer Urut</label>
        <input id="no" name="no" type="number" class="form-control" value="{{ $peleton->no ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  

    <div class="form-group">
        <label for="nama">Nama Pleton</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $peleton->nama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
</form>