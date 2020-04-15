<form id="form" action="{{ $action }}">
    <div class="form-group">
        <label for="kategori">Group Juri</label>
        <input id="kategori" name="kategori" type="text" class="form-control" value="{{ $groupJuri->kategori ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
</form>