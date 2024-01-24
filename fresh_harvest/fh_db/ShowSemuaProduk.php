<?php
require('Koneksi.php');


$kategori = $_POST['kategori'];

$sql = "SELECT * from produk where Kategori = '$kategori';";
$result = $konek->query($sql);
$produk = array();
while ($row = $result->fetch_assoc()) {
    $produk[] = $row;
}
$response = $produk;
echo json_encode($response);
mysqli_close($konek);
?>