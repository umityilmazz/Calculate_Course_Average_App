class Ders {
  String ad;
  double krediDegeri;
  double harfDegeri;

  Ders({required this.ad, required this.harfDegeri, required this.krediDegeri});
  @override
  String toString() {
    return "ad:$ad harfDegeri:$harfDegeri kredidegeri:$krediDegeri";
  }
}
