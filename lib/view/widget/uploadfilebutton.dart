import 'package:flutter/material.dart';

class UploadFileButton extends StatelessWidget {
  final void Function()? onPressed ;
  const UploadFileButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                onPressed: onPressed,
                child:  Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  width: double.infinity,
                  height: 60,
                  child: const Text(
                    "Upload File",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              );
  }
}