import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taca_la/app/components/expansion_tile.dart';
import '../../components/grid_element.dart';

class InfoPapel extends StatelessWidget {
  const InfoPapel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        flexibleSpace: ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade600, Colors.blue.shade800],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Papel",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Center(
              child: Text(
                "Exemplos de papéis recicláveis",
                style: GoogleFonts.poppins(
                    color: Colors.blue[600],
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 260,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: [
                  buildGridElement(
                      context: context,
                      label: "Jornais",
                      colorIcon: Colors.orange[700],
                      icon: Icons.newspaper),
                  buildGridElement(
                      context: context,
                      label: "Caixas",
                      colorIcon: Colors.brown,
                      faIcon: FontAwesomeIcons.boxOpen),
                  buildGridElement(
                      context: context,
                      label: "Revistas",
                      colorIcon: Colors.blue,
                      icon: Icons.menu_book),
                  buildGridElement(
                      context: context,
                      label: "Documentos",
                      colorIcon: Colors.blueAccent,
                      faIcon: FontAwesomeIcons.file),
                  buildGridElement(
                      context: context,
                      label: "Bloco\nde Notas",
                      colorIcon: Colors.red,
                      icon: Icons.sticky_note_2),
                  buildGridElement(
                      context: context,
                      label: "Envelopes",
                      colorIcon: Colors.orange,
                      icon: Icons.email),
                ],
              ),
            ),
            buildExpansionTile(
                context: context,
                color: Colors.blue[600],
                title: "Como realizar o descarte?",
                subtitle:
                    "Remova clipes, grampos e fitas adesivas, dobre ou amasse caixas de papelão para reduzir o volume, evite molhar o papel antes do descarte, pois papéis úmidos não são recicláveis."),
            const SizedBox(height: 12),
            buildExpansionTile(
                context: context,
                color: Colors.blue[600],
                title: "O que não reciclar?",
                subtitle:
                    "Papel higiênico, guardanapos usados, papéis plastificados, papel carbono, papéis engordurados ou contaminados com restos de comida."),
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
