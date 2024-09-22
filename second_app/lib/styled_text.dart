
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget{
  const StyledText(this.text,this.fontSize, this.color,{super.key});

  final String text;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
              text,
              style: GoogleFonts.lato(color: color, fontSize: fontSize),
            );
  }
}