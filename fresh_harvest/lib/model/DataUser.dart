class DataUser {
  final String idUser;
  final String namaLengkap;
  final String noTelpon;
  final String jenisKelamin;
  final String tanggalLahir;
  final String tempatLahir;
  final String role;
  final String email;
  final String password;
  final String foto;
  final String verifikasi;

 

  DataUser({
    required this.idUser,
    required this.namaLengkap,
    required this.noTelpon,
    required this.jenisKelamin,
    required this.tanggalLahir,
    required this.tempatLahir,
    required this.role,
    required this.email,
    required this.password,
    required this.foto,
    required this.verifikasi,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      idUser: json['id_user'] ?? "",
      namaLengkap: json['nama_lengkap'] ?? "",
      noTelpon: json['no_telpon'] ?? "",
      jenisKelamin: json['jenis_kelamin'] ?? "",
      tanggalLahir: json['tanggal_lahir'] ?? "",
      tempatLahir: json['tempat_lahir'] ?? "",
      role: json['role'] ?? "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      foto: json['foto'] ?? "",
      verifikasi: json['verifikasi'] ?? "",
    );
  }
}
