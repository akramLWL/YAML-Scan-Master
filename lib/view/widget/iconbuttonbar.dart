
import 'package:flutter/material.dart';


class IconButtonBar extends StatelessWidget {
  final String text;
  final bool isActive;
  final IconData? icon;
  final void Function()? onPressed;
  const IconButtonBar(
      {super.key, required this.text, required this.isActive, this.icon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isActive ? 3 : 1,
      child: AnimatedContainer(
       duration: const Duration(milliseconds: 10),
      curve: Curves.easeOutExpo, 
        child: MaterialButton(
          color: isActive ? Colors.black : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
          onPressed: onPressed,
          child: isActive
              ? Row(
                 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Icon(icon,
                        color: Colors.white , size: 30,),
                    Text(
                      text,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 22 , fontWeight: FontWeight.bold),
                    )
                  ],
                )
              : Icon(icon, color: const Color.fromARGB(255, 109, 109, 109)),
        ),
      ),
    );
  }
}
