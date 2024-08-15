import 'package:flutter/material.dart';

class TiposLixoCard extends StatelessWidget {
  const TiposLixoCard({super.key, required this.text, required this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/info$text');
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 4,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.recycling,
                size: 56,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(text, style: Theme.of(context).textTheme.displayMedium)
            ],
          ),
        ),
      ),
    );
  }
}
