import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key,
  required this.icon,
  required this.name});
final IconData icon;
final String name;

 
  @override
  Widget build(BuildContext context) {
    return   Padding(
            padding: const EdgeInsets.only(right:16.0,left: 16.0,bottom: 30),
            child: Row(children: [
              Icon(
                icon,
              ),
            
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Text(name, style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      
                      ),),
              ),
                    Spacer(),
            
              Icon(Icons.arrow_forward_ios)
            ],),
          );
  }
}