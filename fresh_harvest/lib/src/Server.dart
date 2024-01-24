class Server {
  static Uri url(url) {
    Uri Server = Uri.parse(
        "http://192.168.1.10/Steal_A_Start_Flutter/isi_github/fresh_harvest/fh_db/" +
            url);
    return Server;
  }

  static String urlGambar(url) {
    String Server = "assets/images/" + url;
    return Server;
  }
}
