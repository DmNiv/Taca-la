import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taca_la/app/components/expansion_tile.dart';
import '../../components/grid_element.dart';

class InfoPlastico extends StatelessWidget {
  const InfoPlastico({super.key});

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
                colors: [Colors.red.shade600, Colors.red.shade800],
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
          "Plástico",
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
                "Exemplos de recicláveis plásticos",
                style: GoogleFonts.poppins(
                    color: Colors.red[600],
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
                      label: "Garrafas\nPet",
                      colorIcon: Colors.blue,
                      faIcon: FontAwesomeIcons.bottleWater),
                  buildGridElement(
                      context: context,
                      label: "Sacolas\nplásticas",
                      colorIcon: Colors.amber[700],
                      icon: Icons.shopping_bag_outlined),
                  buildGridElement(
                      context: context,
                      label: "Brinquedos\nplásticos",
                      colorIcon: Colors.red,
                      icon: Icons.toys),
                  buildGridElement(
                      context: context,
                      label: "Produtos\nde limpeza",
                      colorIcon: Colors.lightBlueAccent,
                      icon: Icons.clean_hands_outlined),
                  buildGridElement(
                      context: context,
                      label: "Potes\nde iogurte",
                      colorIcon: Colors.pinkAccent,
                      faIcon: FontAwesomeIcons.jar),
                  buildGridElement(
                      context: context,
                      label: "Talheres\nplásticos",
                      colorIcon: Colors.redAccent,
                      icon: Icons.restaurant),
                ],
              ),
            ),
            buildExpansionTile(
                context: context,
                color: Colors.red[600],
                title: "Como realizar o descarte?",
                subtitle:
                    "Lave as embalagens para remover restos de alimentos ou produtos, retire tampas e etiquetas, se possível, amasse as garrafas PET para reduzir o volume."),
            const SizedBox(height: 12),
            buildExpansionTile(
                context: context,
                color: Colors.red[600],
                title: "O que não reciclar?",
                subtitle:
                    "Plásticos sujos ou engordurados, embalagens de produtos tóxicos, plásticos misturados com outros materiais, esponjas, isopor (em alguns lugares, o isopor é reciclável, verifique a política local)."
                    ""),
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
