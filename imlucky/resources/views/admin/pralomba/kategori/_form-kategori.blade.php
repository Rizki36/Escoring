<form id="form-kategori" action="{{ $action }}">
    
    {{-- @if(!(isset($isEdit) ? $isEdit : false)) --}}

    <div class="form-group">
        <label for="kode">Kode</label>
        <input id="kode" name="kode" type="text" class="form-control" value="{{ $kategori->kode ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
    {{-- @endif --}}
    <div class="form-group">
        <label for="nama">Nama Kategori</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $kategori->nama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
</form>