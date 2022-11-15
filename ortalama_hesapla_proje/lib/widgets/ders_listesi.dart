import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ortalama_hesapla_proje/constant/app_constant.dart';
import 'package:ortalama_hesapla_proje/helper/data_helper.dart';

class DersListesi extends StatelessWidget {
  final Function silmeIslemi;
  DersListesi({required this.silmeIslemi, super.key});

  @override
  Widget build(BuildContext context) {
    var dersler = DataHelper.tumDersler;
    return dersler.isNotEmpty
        ? ListView.builder(
            itemCount: DataHelper.tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                onDismissed: (d) {
                  silmeIslemi(index);
                },
                key: UniqueKey(),
                child: Card(
                    child: ListTile(
                  title: Text(dersler[index].ad),
                  subtitle: Text(
                      "${dersler[index].krediDegeri} kredi, Harf degeri : ${dersler[index].harfDegeri}"),
                  leading: CircleAvatar(
                    child: Text(
                        (dersler[index].harfDegeri * dersler[index].krediDegeri)
                            .toString()),
                  ),
                )),
              );
            })
        : Center(
            child: Text(
              "Lutfen Ders Ekleyiniz",
              style: GoogleFonts.shadowsIntoLight(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: sabitler.anaRenk,
              ),
            ),
          );
  }
}
