import 'package:flutter/material.dart';
import 'package:ortalama_hesapla_proje/constant/app_constant.dart';

class OrtalamaGoster extends StatelessWidget {
  int dersSayisi;
  String dersAdi;
  double ortalama;
  OrtalamaGoster(
      {required this.dersAdi,
      required this.dersSayisi,
      required this.ortalama,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0
              ? "${dersSayisi.toString()} ders girildi"
              : "Ders Seçiniz",
          style: sabitler.ortalamaTextColor,
        ),
        Text(
          ortalama >= 0 ? ortalama.toStringAsFixed(1) : "0.0",
          style: sabitler.textStyleOrtalama,
        ),
        Text(
          "Ortalama",
          style: sabitler.ortalamaTextColor,
        ),
      ],
    );
  }
}
