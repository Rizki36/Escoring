<form id="form-kategori" action="{{ $action }}">

    <div class="form-group">
        <label for="kode">Kode</label>
        <input id="kode" name="kode" type="text" class="form-control" value="{{ $kategori->kode ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  

    <div class="form-group">
        <label for="nama">Nama Kategori</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $kategori->nama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
    <div class="form-group">
        <label for="bobot_umum">Bobot Umum</label>
        <input id="bobot_umum" name="bobot_umum" type="number" class="form-control" value="{{ $kategori->bobot_umum ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
    <div class="form-group">
        <label for="bobot_utama">Bobot Utama</label>
        <input id="bobot_utama" name="bobot_utama" type="number" class="form-control" value="{{ $kategori->bobot_utama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
    
</form>