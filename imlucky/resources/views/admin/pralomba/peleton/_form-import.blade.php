<form id="form-import" action="{{ route('peleton.import.post') }}" method="POST" enctype="multipart/form-data">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text">Upload</span>
        </div>
        @csrf
        <div class="custom-file">
            <input name="excel" type="file" class="custom-file-input" id="upload-data">
            <label class="custom-file-label" for="upload-data">Upload Data Excel(xls)</label>
        </div>
    </div>
    <a href="{{ url('/files/sekolah.xlsx') }}" role="button" id="btn-download" class="btn btn-primary w-100">Download Template</a>
</form>