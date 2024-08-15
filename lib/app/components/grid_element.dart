import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildGridElement(
    {required BuildContext context,
    required String label,
    required Color? colorIcon,
    IconData? icon,
    IconData? faIcon}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      icon != null
          ? Icon(icon, size: 40, color: colorIcon)
          : FaIcon(faIcon, size: 40, color: colorIcon),
      const SizedBox(height: 8),
      Text(
        label,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ],
  );
}
