import 'package:flutter/material.dart';


class customTextfield extends StatelessWidget {
  const customTextfield({super.key,
    required this.hintText,
    required this.controller,
    required this.contentPadding });

final String hintText;
final TextEditingController controller;
final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    final color =Theme.of(context).colorScheme;
    return 
             Padding(
               padding: const EdgeInsets.only(top:25.0),
               child: SizedBox(
                height: 50, //
                 width: MediaQuery.of(context).size.width, 
                 child: TextField(
                  decoration: InputDecoration(
                    contentPadding: contentPadding,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: hintText,hintStyle:
                     TextStyle(fontSize: 18,color:color.tertiary,
                     fontWeight: FontWeight.w400),
                     
                  ),
                 ),
               ),
             );
  }
}