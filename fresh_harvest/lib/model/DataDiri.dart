
class DataDiri {
  String name = '';
  String email = '';
  String password = '';
  String alamat = '';

  DataDiri({
    required this.name,
    required this.email,
    required this.password,
    required this.alamat,
  });

  factory DataDiri.fromJson(Map<String, dynamic> json) {
    return DataDiri(
      name: json['nama_lengkap'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      alamat: json['alamat'] ?? '',
    );
  }
}
