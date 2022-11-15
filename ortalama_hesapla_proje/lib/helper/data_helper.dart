import 'package:flutter/material.dart';
import 'package:ortalama_hesapla_proje/models/ders.dart';

class DataHelper {

  static List<Ders> tumDersler=[];

  static double dersOrtalamaBul(){
    double krediToplam=0.0;
    double toplam=0.0;
    for (var element in tumDersler) {
      krediToplam+=element.krediDegeri;
      toplam=(element.krediDegeri*element.harfDegeri)+toplam;
    }
    return toplam/krediToplam;
  }

  static final List<Map<String, double>> harfData = [
    {"AA": 4.0},
    {"BA": 3.5},
    {"BB": 3.0},
    {"CB": 2.5},
    {"CC": 2.0},
    {"DC": 1.5},
    {"DD": 1},
    {"FD": 0.5},
    {"FF": 0.0},
  ];

  static List<DropdownMenuItem<double>>? harfleriOlustur = harfData
      .map(
        (e) => DropdownMenuItem(
          value: e.values.first.toDouble(),
          child: Text(
            e.keys.first,
          ),
        ),
      )
      .toList();
  static final List<double> krediler = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  static List<DropdownMenuItem<double>>? kredileriOlustur = krediler
      .map(
        (e) => DropdownMenuItem(
          value: e.toDouble(),
          child: Text(
            e.toString(),
          ),
        ),
      )
      .toList();
}
