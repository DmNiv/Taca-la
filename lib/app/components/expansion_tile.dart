import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildExpansionTile(
    {required BuildContext context,
    required String title,
    required String subtitle,
    required Color? color}) {
  return ExpansionTile(
    title: Text(
      title,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    ],
  );
}
