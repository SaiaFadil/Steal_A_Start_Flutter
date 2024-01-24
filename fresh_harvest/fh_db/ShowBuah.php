<?php
require('Koneksi.php');
$sql = "Select * from produk where Kategori = 'buah' LIMIT 4;";
$result = $konek->query($sql);
$produk = array();
while ($row = $result->fetch_assoc()) {
    $produk[] = $row;
}
$response = $produk;
echo json_encode($response);
mysqli_close($konek);
?>