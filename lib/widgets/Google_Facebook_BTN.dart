import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleFacebook_btn extends StatelessWidget {
  const GoogleFacebook_btn({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    final color =Theme.of(context).colorScheme;
    return  GestureDetector(
              onTap:(){},
              child: Container(padding: EdgeInsets.all(8.0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: color.secondary, width: 1.0),
                ),
                child: Center(
                  child: Row(
                    children: [
                       Image.asset(imagePath,),
              
                      Padding(
                        padding: const EdgeInsets.only(left:16.0),
                        child: Text(text,
                        style: TextStyle(color:color.secondary, fontSize: 18,
                        fontWeight: FontWeight.w400),),
                      )
                    ],
                  ),
                ),
                
              ),
            );
  }
}
