import 'dart:ffi';

import 'package:flutter/material.dart';
import '../constant/app_constant.dart';
import '../helper/data_helper.dart';
class DersHarfSecim extends StatefulWidget {
  Function harfSecim;
  double secilenHarf=4.0;
   DersHarfSecim({required this.harfSecim, super.key});
  @override
  State<DersHarfSecim> createState() => _DersHarfSecimState();
}

class _DersHarfSecimState extends State<DersHarfSecim> {
  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      padding: sabitler.anaPadding,
      decoration: BoxDecoration(
          borderRadius: sabitler.textFormFieldBorder,
          color: sabitler.anaRenk.shade200.withOpacity(0.3)),
      child: DropdownButton(
          underline: Container(),
          value: widget.secilenHarf,
          items: DataHelper.harfleriOlustur,
          onChanged: (deger) {
            setState(
              () {
                widget.secilenHarf = deger!;
                widget.harfSecim(widget.secilenHarf);
              },
            );
          }),
    );
  }
}