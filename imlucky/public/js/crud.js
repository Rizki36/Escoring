class Crud {
    constructor(name, urlRefresh, refreshTable) {
        this.name = name;
        this.urlRefresh = urlRefresh;
        this.refreshTable = refreshTable;
    }
    create(href) {
        let parent = this;
        $.ajax({
            type: "Get",
            url: href,
            beforeSend:function(){
                $('#btn-modal-submit').attr("disabled",false)
            },
            success: response => {
                $("#modal-title").html("Tambah " + parent.name);
                $("#modal-body").html(response);
                $("#btn-modal-submit").html(`Tambah ${parent.name}`);
                $("#modal").modal("show")    
                $("#btn-modal-submit")
                    .off("click")
                    .on("click", e => {
                        parent.store();
                    })
                
            },
            error: response => {
                alert("Terjadi kesalahan, Lihat Console untuk detailnya");
                console.log(response);
            }
        });
    }
    store() {
        let form = $("#form-" + this.name),
            data = $(form).serialize(),
            action = $(form).attr("action"),
            parent = this;
        console.log(data);
        $.ajax({
            type: "POST",
            url: action,
            data: data,
            beforeSend:function(){
                $('#btn-modal-submit').attr("disabled",true)
            },
            success: function(response) {
                $("#modal").modal("hide");
                Swal.fire(
                    "Success",
                    `${parent.name} berhasil ditambahkan!`,
                    "success"
                );
                parent.refresh();
            },
            error(response) {
                $('#btn-modal-submit').attr("disabled",false)
                $(".is-invalid").removeClass("is-invalid");
                $.each(response.responseJSON.errors, function(index, value) {
                    $("#" + index).addClass("is-invalid");
                    $("#" + index)
                        .siblings(".invalid-feedback")
                        .html(value);
                });
                console.log(response);
            }
        });
    }
    edit(href) {
        let parent = this;
        $.ajax({
            type: "GET",
            url: href,
            beforeSend:function(){
                $('#btn-modal-submit').attr("disabled",false)
            },
            success: function(response) {
                $("#modal-title").html("Update " + parent.name);
                $("#modal-body").html(response);
                $("#btn-modal-submit").html(`Update ${parent.name}`);
                $("#modal").modal("show");
                $("#btn-modal-submit")
                    .off("click")
                    .on("click", function(e) {
                        parent.update();
                    });
            },
            error(response) {
                alert("Terjadi kesalahan, Lihat Console untuk detailnya");
                console.log(response);
            }
        });
    }
    update() {
        let form = $(`#form-${this.name}`),
            data = $(form).serialize(),
            action = $(form).attr("action"),
            parent = this;
        $.ajax({
            type: "PUT",
            url: action,
            data: data,
            beforeSend:function(){
                $('#btn-modal-submit').attr("disabled",true)
            },
            success: function(response) {
                $("#modal").modal("hide");
                Swal.fire(
                    "Updated",
                    `Update ${parent.name} berhasil!`,
                    "success"
                );
                parent.refresh();
            },
            error(response) {
                $('#btn-modal-submit').attr("disabled",false)
                $(".is-invalid").removeClass("is-invalid");
                $.each(response.responseJSON.errors, function(index, value) {
                    $("#" + index).addClass("is-invalid");
                    $("#" + index)
                        .siblings(".invalid-feedback")
                        .html(value);
                });
                console.log(response);
            }
        });
    }
    destroy(href) {
        let parent = this;
        Swal.fire({
            title: "Apakah kamu yakin?",
            text: `Kamu akan menghapus ${parent.name}!`,
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes"
        }).then(result => {
            // action if answer is true
            if (result.value) {
                // ajax delete peleton
                $.ajax({
                    type: "DELETE",
                    url: href,
                    success: function(response) {
                        parent.refresh();
                        // Swal if ajax success
                        Swal.fire(
                            "Deleted!",
                            `${parent.name} berhasil dihapus!`,
                            "success"
                        );
                    },
                    error(e) {
                        Swal.fire(
                            "Error",
                            `${parent.name} gagal dihapus!`,
                            "error"
                        );
                        console.log(e);
                    }
                });
            }
        });
    }
    refresh() {
        let parent = this;
        $.ajax({
            type: "GET",
            url: parent.urlRefresh,
            success: function(response) {
                $(`#table-${parent.refreshTable} tbody`).html(response);
            },
            error(e) {
                Swal.fire(
                    "Error",
                    `Gagal merefresh data ${parent.name}`,
                    "error"
                );
                console.log(e);
            }
        });
    }
}
