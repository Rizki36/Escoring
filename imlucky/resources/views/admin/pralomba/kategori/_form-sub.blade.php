<form id="form-sub" action="{{ $action }}">
    
    {{-- @if(!(isset($isEdit) ? $isEdit : false)) --}}

    <input name="parentId" type="hidden" class="form-control" value="{{ $kategori }}">
    <div class="form-group">
        <label for="kode">Kode</label>
        <input id="kode" name="kode" type="text" class="form-control" value="{{ $sub->kode ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
    {{-- @endif --}}
    <div class="form-group">
        <label for="nama">Nama Sub</label>
        <input id="nama" name="nama" type="text" class="form-control" value="{{ $sub->nama ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
</form>