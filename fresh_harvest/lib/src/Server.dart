class Server {
  static Uri url(url) {
    Uri Server = Uri.parse("http://172.17.202.9/Steal_A_Start_Flutter/isi_github/fresh_harvest/fh_db/" + url);
    return Server;
  }

  static String urlGambar(url) {
    String Server = "assets/images/" + url;
    return Server;
  }
}
