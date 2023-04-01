import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(38, 27, 27, 29),
    offset: Offset(0, 5),
    blurRadius: 10,
  );

  static BoxShadow buttonGreyShadow = BoxShadow(
    offset: const Offset(0, 1),
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: 1,
    blurRadius: 2,
  );
}