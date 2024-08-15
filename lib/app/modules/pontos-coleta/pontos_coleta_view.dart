import 'package:flutter/material.dart';
import 'package:taca_la/app/modules/pontos-coleta/pontos_info_card.dart';

class PontosColetaView extends StatelessWidget {
  const PontosColetaView({super.key});

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
          "Pontos de coleta",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          LocalInfoCard(
              localName: 'Universidade Federal do Pará',
              imageUrl:
                  'https://s1.static.brasilescola.uol.com.br/vestibular/2020/12/ufpa.jpg',
              address: 'R. Augusto Corrêa, 01 - Guamá, Belém - PA, 66075-110',
              mapsUrl: 'https://maps.app.goo.gl/xVksJez8HXVF5r8Z9'),
        ],
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
