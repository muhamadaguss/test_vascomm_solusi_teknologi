import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle titlestyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.roboto(fontSize: size.sp, color: color, fontWeight: fw);
}

TextStyle subtitlestyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.nunitoSans(
      fontSize: size.sp, color: color, fontWeight: fw);
}
