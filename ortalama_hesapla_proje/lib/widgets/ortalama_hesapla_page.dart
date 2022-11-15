import 'package:flutter/material.dart';
import 'package:ortalama_hesapla_proje/constant/app_constant.dart';
import 'package:ortalama_hesapla_proje/helper/data_helper.dart';
import 'package:ortalama_hesapla_proje/widgets/ders_harf_secim.dart';
import 'package:ortalama_hesapla_proje/widgets/ders_listesi.dart';
import 'package:ortalama_hesapla_proje/widgets/ortalama_goster.dart';

import '../models/ders.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({super.key});

  @override
  State<OrtalamaHesapla> createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  double secilenHarf = 4;
  double secilenKredi = 1;
  String dersAdi = "";
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            /**Build Form */ Expanded(
              flex: 2,
              child: _buildForm(),
            ),
            /*Ortalama göster*/ Expanded(
              child: OrtalamaGoster(
                dersAdi: dersAdi,
                dersSayisi: DataHelper.tumDersler.length,
                ortalama: DataHelper.dersOrtalamaBul(),
              ),
            ),
          ],
        ),
        /**Ders Listesi*/ Expanded(
          child: DersListesi(silmeIslemi: (gelenIndex) {
            DataHelper.tumDersler.removeAt(gelenIndex);
            setState(() {});
          }),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildTextFormField(),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              // HARF SEÇİMİ
              Padding(
                padding: const EdgeInsets.only(right: 1),
                child: DersHarfSecim(harfSecim: (gelenHarf) {
                  secilenHarf = gelenHarf;
                }),
              ),
              //KREDİ SEÇİMİ
              krediOlustur(),
              //ICON BUTTON
              Expanded(
                child: IconButton(
                  iconSize: 35,
                  onPressed: dersEkleOrtalmaHesapla,
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: sabitler.anaRenk,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Container krediOlustur() {
    return Container(
      padding: sabitler.anaPadding,
      decoration: BoxDecoration(
        borderRadius: sabitler.textFormFieldBorder,
        color: sabitler.anaRenk.shade200.withOpacity(0.3),
      ),
      child: DropdownButton(
        underline: Container(),
        items: DataHelper.kredileriOlustur,
        value: secilenKredi,
        onChanged: (deger) {
          setState(() {
            secilenKredi = deger ?? 1;
          });
        },
      ),
    );
  }

  Container buildTextFormField() {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: TextFormField(
        validator: (girilenDeger) {
          if (girilenDeger!.isEmpty) {
            return "Lutfen bir ders adı giriniz";
          } else {
            return null;
          }
        },
        onSaved: (girilenDeger) {
          setState(() {});
          dersAdi = girilenDeger ?? "";
        },
        decoration: InputDecoration(
          hintText: "Ders Adı giriniz",
          labelText: "Ders",
          filled: true,
          fillColor: sabitler.anaRenk.shade200.withOpacity(0.2),
          border: OutlineInputBorder(
              borderRadius: sabitler.textFormFieldBorder,
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  void dersEkleOrtalmaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: dersAdi,
          harfDegeri: secilenHarf,
          krediDegeri: secilenKredi.toDouble());
      DataHelper.tumDersler.add(eklenecekDers);
      setState(() {});
    }
  }

  Function? listeElemanSilme(int index) {
    setState(() {
      DataHelper.tumDersler.removeAt(index);
    });
    return null;
  }
}
