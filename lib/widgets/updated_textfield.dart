import 'package:flutter/material.dart';


class UpdatedTextfield extends StatelessWidget {
  const UpdatedTextfield({super.key,
    required this.hintText,
    required this.controller,
    required this.contentPadding,
    required this.height,
    required this.width,
    required this.text});

final String text;
final String hintText;
final double height;
final double width;
final TextEditingController controller;
final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    final color =Theme.of(context).colorScheme;
    return 
             Column(
             crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text(text,style: TextStyle(
                  color:color.secondary, fontSize: 18,
                  fontWeight: FontWeight.w500
                ),),
                 Padding(
                   padding: const EdgeInsets.only(top:2.0),
                   child: SizedBox(
                    height: height, 
                     width: width, 
                     child: TextField(
                      decoration: InputDecoration(
                        contentPadding: contentPadding,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                       
                        ),
                        hintText: hintText,hintStyle:
                         TextStyle(fontSize: 16,color:color.tertiary,
                         fontWeight: FontWeight.w500),
                         
                      ),
                     ),
                   ),
                 ),
               ],
             );
  }
}