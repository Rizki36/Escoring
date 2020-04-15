<form id="form" action="{{ $action }}">
    <div class="form-group">
        <label for="kategori">Group Juri</label>
        <select id="kategori" class="form-control" name="kategori">
            @foreach ($kategoris as $kategori)
                <option value="{{ $kategori->id }}">{{ $kategori->nama }}</option>
            @endforeach
        </select>
        <div class="invalid-feedback"></div>
    </div>  
</form>