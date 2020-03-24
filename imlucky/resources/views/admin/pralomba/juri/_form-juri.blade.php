<form id="form-juri" action="{{ $action }}">
    <div class="form-group">
        <label for="kode">Kode</label>
        <input id="kode" name="kode" type="text" class="form-control" value="{{ $juri->kode ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  

    <div class="form-group">
        <label for="nama">Nama Juri</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $juri->nama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  

    <div class="form-group">
        <label for="password">Password</label>
        <input id="password" name="password" type="text" class="form-control" value="{{ $juri->password ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
</form>