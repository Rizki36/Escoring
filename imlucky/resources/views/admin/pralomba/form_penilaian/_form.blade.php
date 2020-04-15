<form id="form" action="{{ $action }}">
    <div class="form-group">
        <label for="nilai">Nilai</label>
        <input id="nilai" name="nilai" type="text" class="form-control" value="{{ $penilaian->nilai ?? '' }}">
        <div class="invalid-feedback"></div>
    </div>  
</form>