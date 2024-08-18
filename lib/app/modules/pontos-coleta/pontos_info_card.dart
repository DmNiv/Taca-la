import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalInfoCard extends StatelessWidget {
  final String localName;
  final String imageUrl;
  final String address;
  final String mapsUrl;

  const LocalInfoCard(
      {super.key,
      required this.localName,
      required this.imageUrl,
      required this.address,
      required this.mapsUrl});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Não foi possível abrir a URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(imageUrl,
                      width: 200, height: 200, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                localName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Divider(
                color: Colors.grey[300],
              ),
              Text(
                address,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () => _launchURL(mapsUrl),
                  icon: const Icon(Icons.map_rounded),
                  label: const Text('Abrir no Google Mapas'),
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: Colors.green[500],
                    foregroundColor: Colors.white,
                    textStyle: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
