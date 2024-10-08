<?php

    require_once("../connectdb.php");
    login();

    $ID_Barang = $_GET['ID_Barang']; 

    $sql_cari = "SELECT * FROM barang WHERE ID_Barang = '$ID_Barang'";
    $query = mysqli_query($koneksi, $sql_cari);
    $result = mysqli_fetch_assoc($query);

    if(isset($_POST['submit'])) {
        $ID_Barang = $_POST['ID_Barang'];
        $nama_barang = $_POST['nama_barang'];
        $kategori = $_POST['kategori'];
        $harga_jual = $_POST['harga_jual'];
        $harga_beli = $_POST['harga_beli'];
        $stok = $_POST['stok'];

        $sql_edit = "UPDATE barang SET nama_barang = '$nama_barang', kategori = '$kategori', harga_jual = '$harga_jual', harga_beli = '$harga_beli', stok ='$stok' WHERE ID_Barang = '$ID_Barang' ";
        mysqli_query($koneksi, $sql_edit);

        header("Location:../data-kepala-barang.php");
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Edit Barang </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body style="background-color: #7ECA9C;">
    <!-- EDIT DATA  -->
    <div class="container-sm"> <br>
        <h1 class="display-5">UPDATE BARANG</h1>
        <hr>
        <form action="edit-kepala-barang.php" method="POST">
            <table><br>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label" hidden>ID Barang</label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" name="ID_Barang" value="<?= $result['ID_Barang'];?>" hidden>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Nama Barang</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="nama_barang" value="<?= $result['nama_barang'];?>" >
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Kategori</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="kategori" value="<?= $result['kategori'];?>" >
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Harga Jual</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="harga_jual" value="<?= $result['harga_jual'];?>" >
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Harga Beli</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="harga_beli" value="<?= $result['harga_beli'];?>" >
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Stok</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="stok" value="<?= $result['stok'];?>" >
                    </div>
                </div>

            </table><br>
            <div class="float-xl-right">
                <button class="btn btn-warning" name="submit" type="submit">Update</button>
                <a href="../data-kepala-barang.php" class="btn btn-danger"> Cancel </a>
            </div>

        </form>
    </div>
</body>
</html>