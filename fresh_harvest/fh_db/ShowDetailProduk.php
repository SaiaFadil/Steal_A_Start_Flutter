<?php
require('Koneksi.php');
$id_produk = $_POST['id_produk'];
$sql = "Select * from produk where id_produk = '$id_produk' ;";
$result = $konek->query($sql);
$produk =  $result->fetch_assoc();


$response = $produk;
echo json_encode($response);
mysqli_close($konek);
?>