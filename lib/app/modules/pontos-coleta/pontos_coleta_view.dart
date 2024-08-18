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
              localName:
                  'Associação de Catadores da Coleta Seletiva de Belém - ACCSB',
              imageUrl:
                  'https://lh5.googleusercontent.com/p/AF1QipO-JMOMZtqHLEgimaWOGxKkzEymiGiKo56G6T6F=w408-h544-k-no',
              address:
                  'Av. Independência - Maracangalha, Belém - PA, 66120-500',
              mapsUrl: 'https://maps.app.goo.gl/4zaj9N6wciqbBBoA6'),
          LocalInfoCard(
              localName: 'Associação Dos Recicladores De Águas Lindas - ARAL',
              imageUrl:
                  'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=z0rRcSFAsD7DkvDR3ntXMA&cb_client=search.gws-prod.gps&w=408&h=240&yaw=205.21252&pitch=0&thumbfov=100',
              address: 'Rua do Canal - Margem Direita - s/n - Maracangalha, PA',
              mapsUrl: 'https://maps.app.goo.gl/9bSmSBRgHbeMQB7x8'),
          LocalInfoCard(
              localName: 'Cooperativa de Reciclagem CONCAVES',
              imageUrl:
                  'https://lh5.googleusercontent.com/p/AF1QipNa15r1qAnL5WLR1m_5_zqnWckrgXQNpGz8HLza=w408-h306-k-no',
              address:
                  'Av. Bernardo Sayão, 2176 - Condor, Belém - PA, 66033-190',
              mapsUrl: 'https://maps.app.goo.gl/4gRfnfD8JsmoC8bH6'),
          LocalInfoCard(
              localName: 'Cooperativa Filhos Do Sol',
              imageUrl:
                  'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=JpKtFhn8xHngxZfN0LSQhg&cb_client=search.gws-prod.gps&w=408&h=240&yaw=17.486345&pitch=0&thumbfov=100',
              address:
                  'Tv. Padre Eutíquio, 2595-2623 - Condor, Belém - PA, 66045-225',
              mapsUrl: 'https://maps.app.goo.gl/QT49qPtQDVzYmhWR6')
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
