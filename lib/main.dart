import 'package:flutter/material.dart';
import 'package:taca_la/app/modules/pontos-coleta/pontos_coleta_view.dart';
import 'package:taca_la/app/modules/pagina-inicial/pagina_inicial_view.dart';
import 'package:taca_la/app/modules/infos/info_plastico.dart';
import 'package:taca_la/app/modules/infos/info_papel.dart';
import 'package:taca_la/app/modules/infos/info_vidro.dart';
import 'package:taca_la/app/modules/infos/info_metal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taca_la/app/modules/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taca-la',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          backgroundColor: Colors.grey[200],
          accentColor: Colors.greenAccent,
        ),
        textTheme: TextTheme(
          displayLarge:
              GoogleFonts.permanentMarker(color: Colors.white, fontSize: 44),
          displayMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26),
          headlineMedium: GoogleFonts.roboto(
              fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 20),
          headlineSmall: GoogleFonts.roboto(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 15),
          bodyLarge: GoogleFonts.roboto(
              fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 18),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const PaginaInicialView(),
        '/pontos': (context) => const PontosColetaView(),
        '/infoPlástico': (context) => const InfoPlastico(),
        '/infoPapel': (context) => const InfoPapel(),
        '/infoVidro': (context) => const InfoVidro(),
        '/infoMetal': (context) => const InfoMetal(),
      },
    );
  }
}
