<form id="form" action="{{ $action }}">
    @if (route('juri.store') == $action)
    <div class="form-group">
        <label for="group_juri">Group Juri</label>
        <select id="group_juri" class="form-control" name="group_juri">
            @foreach ($group_juris as $group_juri)
                <option value="{{ $group_juri->id }}">{{ $group_juri->kategori }}</option>
            @endforeach
        </select>
        <div class="invalid-feedback"></div>
    </div>  
    @endif

    <div class="form-group">
        <label for="kode">User</label>
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