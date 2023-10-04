import 'package:app_consula_cep/pages/busca_cep_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.aBeeZeeTextTheme()
      ),
      home: BuscaCepPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
