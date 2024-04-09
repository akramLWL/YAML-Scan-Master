import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final void Function()? onPressed ;
  final String textButtonfloating ;
  const CustomFloatingButton({super.key, this.onPressed, required this.textButtonfloating});
  

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
                onPressed: onPressed ,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  width: double.infinity,
                  height: 60,
                  child:  Text(
                    textButtonfloating,
                    textAlign:  TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              );
  }
}