// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;

  const modified_text({super.key, required this.text, this.color, this.size});
 
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(
        color: color ?? Colors.white,
        fontSize: size,
       
      ),
      
    );
  }
}
