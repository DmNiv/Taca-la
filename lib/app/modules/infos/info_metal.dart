import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taca_la/app/components/expansion_tile.dart';
import '../../components/grid_element.dart';

class InfoMetal extends StatelessWidget {
  const InfoMetal({super.key});

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
                colors: [Colors.yellow.shade600, Colors.yellow.shade800],
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
          "Metal",
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
                "Exemplos de metais recicláveis",
                style: GoogleFonts.poppins(
                    color: Colors.yellow[800],
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
                      label: "Latas de\nAlumínio",
                      colorIcon: Colors.grey,
                      faIcon: FontAwesomeIcons.beerMugEmpty),
                  buildGridElement(
                      context: context,
                      label: "Latas de\nAço",
                      colorIcon: Colors.brown,
                      faIcon: FontAwesomeIcons.oilCan),
                  buildGridElement(
                      context: context,
                      label: "Ferragens",
                      colorIcon: Colors.black54,
                      faIcon: FontAwesomeIcons.screwdriverWrench),
                  buildGridElement(
                      context: context,
                      label: "Cabos e\nFios de Cobre",
                      colorIcon: Colors.brown,
                      icon: Icons.stacked_line_chart),
                  buildGridElement(
                      context: context,
                      label: "Panelas de\nAço Inox",
                      colorIcon: Colors.grey,
                      faIcon: FontAwesomeIcons.utensils),
                  buildGridElement(
                      context: context,
                      label: "Objetos de\nAlumínio",
                      colorIcon: Colors.blueGrey,
                      icon: Icons.kitchen),
                ],
              ),
            ),
            buildExpansionTile(
                context: context,
                color: Colors.yellow[800],
                title: "Como realizar o descarte?",
                subtitle:
                    "Lave as latas para remover resíduos, amasse as latas de alumínio para economizar espaço, verifique se há locais específicos para descarte de metais pesados, como baterias e eletrodomésticos."),
            const SizedBox(height: 12),
            buildExpansionTile(
                context: context,
                color: Colors.yellow[800],
                title: "O que não reciclar?",
                subtitle:
                    "Latas de tinta, produtos de aço inoxidável, latas de aerossol (sem esvaziar completamente), chapas de metal muito grandes."),
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
