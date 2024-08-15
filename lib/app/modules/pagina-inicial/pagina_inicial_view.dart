import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taca_la/app/modules/pagina-inicial/tipos_lixo_card.dart';

class PaginaInicialView extends StatelessWidget {
  const PaginaInicialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          'Taca-lá',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        flexibleSpace: ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade700, Colors.green.shade800],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                'Informações sobre o descarte',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: [
                    TiposLixoCard(text: 'Plástico', color: Colors.red[400]),
                    TiposLixoCard(text: 'Papel', color: Colors.blue[400]),
                    TiposLixoCard(text: 'Vidro', color: Colors.green[500]),
                    TiposLixoCard(text: 'Metal', color: Colors.yellow[700]),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/pontos');
                },
                icon: const Icon(Icons.location_on_outlined),
                label: const Text('Encontrar pontos de coleta'),
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Colors.green[500],
                  foregroundColor: Colors.white,
                  textStyle: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
