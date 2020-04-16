<form id="form" action="{{ $action }}">
    <div class="form-group">
        <label for="ballot">Nilai</label>
        <input id="ballot" name="ballot" type="number" class="form-control" value="{{ $peleton->ballot ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
</form>