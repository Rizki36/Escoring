<form id="form" action="{{ $action }}">
    <div class="form-group">
        <label for="pinalti">Nilai</label>
        <input id="pinalti" name="pinalti" type="text" class="form-control" value="{{ $peleton->pinalti ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
</form>