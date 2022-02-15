import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textUtils({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  bool underLine =false
}) =>
    Text(
      '${text}',

      style: GoogleFonts.lato(
          color: color ?? Colors.white,
          fontSize: fontSize ?? 35,
          decoration:underLine? TextDecoration.underline:null,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
