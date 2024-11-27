import 'package:flutter/material.dart';

List<Widget> withGap({ double? width, double? height, required List<Widget> children }) {
  List<Widget> list = [];
  
  for (var child in children) {
    list.add(child);

    if (children.last != child) {
      list.add(SizedBox(width: width, height: height));
    }
  }

  return list;
}