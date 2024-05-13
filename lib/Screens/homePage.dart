import 'package:ai_mhealth_app/widgets/shortcut_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final color= Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0),
        child: GNav(
          //backgroundColor: color.secondary,
         // activeColor:color.onPrimary ,
          tabBackgroundColor: color.primary,
          padding: EdgeInsets.all(16),
          gap: 8.0,
          iconSize: 33,
          tabs:const[
          GButton(icon:Icons.home,
          text: 'Home',),
          GButton(icon:Icons.notification_important,
          text: 'Notification',),
          GButton(icon:Icons.settings,
          text: 'Settings',),
          
        ]),
      ),
      
      appBar: AppBar(centerTitle: true,

                    elevation: 0,
      backgroundColor: Colors.transparent,
        title:Text('Welcome To Health AI',
                  style:TextStyle(fontSize: 24
                  ,fontWeight: FontWeight.bold, color:color.secondary ),),
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: 
        Padding(
          padding: const EdgeInsets.only(left:16.0,right: 16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:16.0,top: 16),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.35,
                        width: MediaQuery.of(context).size.width,
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:Color.fromARGB(255, 235, 233, 233)
                        ),
                        child: SingleChildScrollView(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom:8.0),
                                child: Container(
                                  height:  MediaQuery.of(context).size.height*0.28,
                                  width:  MediaQuery.of(context).size.width,
                                
                                  decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                  child: Image.asset('assets/sethoscope 4.jpg',fit: BoxFit.cover,),
                                ),
                              ),
                             
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Check yourself with AI',
                                                    style:TextStyle(fontSize: 18
                                                    ,fontWeight: FontWeight.bold, color:color.secondary ),),
                                  
                                                    Container(padding: EdgeInsets.all(7.0),
                                                      width: 65,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(),
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: color.primary
                                                      ),
                                                      
                                                      child: Text('Start',
                                                    style:TextStyle(fontSize: 18
                                                    ,fontWeight: FontWeight.bold, color:color.secondary ),),
                                  
                                                    ),
                                ],
                              )
                                
                            ],
                          ),
                        ),
                      ),
                    ),
          
                    Text('Explore',
                    style:TextStyle(fontSize: 20
                    ,fontWeight: FontWeight.w600, color:color.secondary ),),
          
                    Padding(
                      padding: const EdgeInsets.only(
                       top:5.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.4,
                        width: MediaQuery.of(context).size.width,
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 235, 233, 233)
                        ),

                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16.0,top: 25,bottom: 90),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    shortCut(activity: 'Connect\nwith\nDoctor',
                                     imageName: 'assets/doctor.png'),
                                
                                     shortCut(activity: 'Meds\nAlert',
                                      imageName: 'assets/alarm.png')
                                  ],
                                ),
                              ),
                          
                               Padding(
                                 padding: const EdgeInsets.only(left:16.0,right: 16.0,bottom: 25),
                                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    shortCut(activity: 'Health\nEducation',
                                     imageName: 'assets/book.png'),
                                 
                                     shortCut(activity: 'History', 
                                     imageName: 'assets/history.png'),
                                  ],
                                     ),
                               )
                            ],
                          ),
                        ),
                      ),
                    )
            ],
          ),
        )),
      ),
    );
  }
}