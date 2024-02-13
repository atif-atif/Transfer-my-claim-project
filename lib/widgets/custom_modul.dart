import 'package:flutter/material.dart';

class CustomModule {
  String title;
  String img;
  GestureTapCallback? onTap;
  CustomModule(
    this.title,
    this.img,
    this.onTap,
  );
}
