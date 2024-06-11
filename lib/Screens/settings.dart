import 'package:ai_mhealth_app/widgets/setting_list.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-screen';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(appBar: AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: color.primary,

             leading: Container(
          height: 55,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.primary,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: color.onPrimary,
            ),
          ),
        ),
      ),
    
     
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height*0.2,
            width: MediaQuery.sizeOf(context).width,
           
            decoration: BoxDecoration(
               color: color.primary,
               borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30), bottomRight: Radius.circular(30)),

            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:20.0, bottom: 20),
                  child: Text('SETTINGS', style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: color.onPrimary,
                    letterSpacing: 1.3
                  ),),

                ),

                Text('saintpatrick38@gmail.com', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color.onPrimary,
                    letterSpacing: 1.2
                  ),),
              ],
            ),
          
          ),
          SizedBox(height: 30,),

        SettingsWidget(icon:Icons.person, name: 'Account'),

        SettingsWidget(icon:Icons.notifications, name: 'Notification'),

        SettingsWidget(icon:Icons.lock, name: 'Privacy and Security'),

        SettingsWidget(icon:Icons.headphones, name: 'Help and Support'),

        SettingsWidget(icon:Icons.question_mark_sharp, name: 'About'),

        SettingsWidget(icon:Icons.logout, name: 'LogOut')
        ],
      )
    );
  }
}
