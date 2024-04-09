import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const CustomCard({super.key, required this.text,required this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(minHeight: 100, minWidth: 100),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
