import 'package:flutter/material.dart';
import 'package:ortalama_hesapla_proje/constant/app_constant.dart';
import 'package:ortalama_hesapla_proje/widgets/ortalama_hesapla_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: sabitler.anaRenk),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: sabitler.appBarText,
          centerTitle: true,
          backgroundColor: sabitler.appBarColor,
        ),
        body: OrtalamaHesapla(),
      ),
    );
  }
}
