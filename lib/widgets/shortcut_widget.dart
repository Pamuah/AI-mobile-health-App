import 'package:flutter/material.dart';

class shortCut extends StatelessWidget {
  const shortCut({super.key, required this.activity,
                    required this.imageName});

final String activity;
final String imageName;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return  Row(
                               children: [
                                 Container(padding: EdgeInsets.all(0.0),
                                                     width: 60,
                                                     height: 80,
                                                     decoration: BoxDecoration(
                                                       border: Border.all(width: 2.0),
                                                       borderRadius: BorderRadius.circular(10.0),
                                                       color: color.onPrimary
                                                     ),
                                                     
                                                     child:Image.asset(imageName,height: 45,width: 35,)
                                 ),

                                 Padding(
                                   padding: const EdgeInsets.only(left:5.0),
                                   child: Text(activity,
                                                       style:TextStyle(fontSize: 18
                                                       ,fontWeight: FontWeight.w500, color:color.secondary ),),
                                 ),
                               ],
                             );
  }
}