import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taca_la/app/components/expansion_tile.dart';
import '../../components/grid_element.dart';

class InfoVidro extends StatelessWidget {
  const InfoVidro({super.key});

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
                colors: [Colors.green.shade600, Colors.green.shade800],
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
          "Vidro",
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
                "Exemplos de vidros recicláveis",
                style: GoogleFonts.poppins(
                    color: Colors.green[600],
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
                    label: "Garrafas\nde vidro",
                    colorIcon: Colors.green,
                    faIcon: FontAwesomeIcons.wineBottle,
                  ),
                  buildGridElement(
                    context: context,
                    label: "Potes\nde vidro",
                    colorIcon: Colors.brown,
                    faIcon: FontAwesomeIcons.jarWheat,
                  ),
                  buildGridElement(
                    context: context,
                    label: "Copos\nde vidro",
                    colorIcon: Colors.orangeAccent,
                    faIcon: FontAwesomeIcons.champagneGlasses,
                  ),
                  buildGridElement(
                    context: context,
                    label: "Frascos\nde remédio",
                    colorIcon: Colors.blue,
                    faIcon: FontAwesomeIcons.flask,
                  ),
                  buildGridElement(
                    context: context,
                    label: "Lâmpadas\nincandescentes",
                    colorIcon: Colors.yellow,
                    faIcon: FontAwesomeIcons.lightbulb,
                  ),
                  buildGridElement(
                    context: context,
                    label: "Vidros\nde perfume",
                    colorIcon: Colors.red,
                    faIcon: FontAwesomeIcons.whiskeyGlass,
                  ),
                ],
              ),
            ),
            buildExpansionTile(
                context: context,
                color: Colors.green[600],
                title: "Como realizar o descarte?",
                subtitle:
                    "Lave os recipientes para remover resíduos de alimentos ou líquidos, separe os vidros por cor (transparente, verde e âmbar) se possível, pois facilita a reciclagem, embale os cacos de vidro em um recipiente seguro, como uma caixa, para evitar acidentes."),
            const SizedBox(height: 12),
            buildExpansionTile(
                context: context,
                color: Colors.green[600],
                title: "O que não reciclar?",
                subtitle:
                    "Espelhos, vidros de janela temperados, lâmpadas, cerâmicas, porcelanas, vidros com filmes adesivos ou laminados."),
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
