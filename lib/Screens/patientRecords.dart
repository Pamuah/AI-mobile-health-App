import 'package:ai_mhealth_app/widgets/updated_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Patient_Records extends StatefulWidget {
  const Patient_Records({super.key});

  @override
  State<Patient_Records> createState() => _Patient_RecordsState();
}

class _Patient_RecordsState extends State<Patient_Records> {
  TextEditingController FirstNamecontroller = TextEditingController();
  TextEditingController Surnamecontroller = TextEditingController();
  TextEditingController DOBcontroller = TextEditingController();
  TextEditingController Heightcontroller = TextEditingController();
  TextEditingController Weightcontroller = TextEditingController();
  TextEditingController Gendercontroller = TextEditingController();
  TextEditingController BloodGroupcontroller = TextEditingController();
  TextEditingController Contactcontroller = TextEditingController();
  TextEditingController ExtraConditionscontroller = TextEditingController();


  bool? DiabetesCheck=false;
  bool? HypertensionCheck=false;
  bool? AsthmaCheck=false;
  bool? HIVCheck=false;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: 
      AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 70,
        centerTitle: true,
        title: Text('Patient Records',style:TextStyle(fontSize: 24
                  ,fontWeight: FontWeight.bold, color:color.secondary ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UpdatedTextfield(hintText: 'Patrick',
                   controller: FirstNamecontroller,
                    contentPadding: EdgeInsets.only(top: 5,left: 16.0), 
                    height: 55, 
                    width: MediaQuery.of(context).size.width*0.4,
                     text:'First Name' ),
                     
                      Padding(
                        padding: const EdgeInsets.only(left:25.0),
                        child: UpdatedTextfield(hintText: 'Amuah',
                                         controller: Surnamecontroller,
                                          contentPadding: EdgeInsets.only(top: 5,left: 16.0), 
                                          height: 55, 
                                          width: MediaQuery.of(context).size.width*0.4,
                                           text:'Surname' ),
                      ),
                ],
              ),
        
        
               Padding(
                 padding: const EdgeInsets.only(top:20.0, bottom: 20.0),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UpdatedTextfield(hintText: 'dd-mm-yy',
                     controller: DOBcontroller,
                      contentPadding: EdgeInsets.only(top: 5,left: 16.0), 
                      height: 55, 
                      width: MediaQuery.of(context).size.width*0.5,
                       text:'Date Of Birth' ),
                       
                        Padding(
                          padding: const EdgeInsets.only(left:25.0),
                          child: UpdatedTextfield(hintText: 'M/F',
                                           controller: Gendercontroller,
                                            contentPadding: EdgeInsets.only(top: 5,left: 16.0), 
                                            height: 55, 
                                            width: MediaQuery.of(context).size.width*0.3,
                                             text:'Gender' ),
                        ),
                  ],
                             ),
               ),
        
                   Padding(
                 padding: const EdgeInsets.only( bottom: 20.0),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UpdatedTextfield(hintText: 'eg. O+',
                     controller: BloodGroupcontroller,
                      contentPadding: EdgeInsets.only(top: 5,left: 16.0), 
                      height: 55, 
                      width: MediaQuery.of(context).size.width*0.25,
                       text:'Blood Group'),
                       
                        
                          UpdatedTextfield(hintText: 'eg 180cm',
                                           controller: Heightcontroller,
                                            contentPadding: EdgeInsets.only(top: 5,left: 16.0), 
                                            height: 55, 
                                            width: MediaQuery.of(context).size.width*0.25,
                                             text:'Height' ),
                    
        
                         UpdatedTextfield(hintText: 'eg 85kg',
                                           controller: Weightcontroller,
                                            contentPadding: EdgeInsets.only(top: 5,left: 16.0), 
                                            height: 55, 
                                            width: MediaQuery.of(context).size.width*0.25,
                                             text:'Weight' ),
                       
                  ],
                             ),
               ),
            Padding(
              padding: const EdgeInsets.only(top:12.0, bottom: 12.0),
              child: Text('Check the box if you have any of the following Health Condition',style:TextStyle(fontSize: 14
                      ,fontWeight: FontWeight.w500, color:const Color.fromARGB(255, 239, 104, 104) ),),
            ),
        
                     Padding(
                       padding: const EdgeInsets.only(bottom:15.0),
                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       
                         children: [
                           Column(crossAxisAlignment: CrossAxisAlignment.start,
                       
                             children: [
                               Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(right:7.0),
                                         child: Text('Diabetes',style: TextStyle(
                                           fontSize: 20,fontWeight: FontWeight.w500,color: color.secondary
                                         ),),
                                       ),
                                         
                                           Checkbox(value: DiabetesCheck, 
                                                 activeColor: color.secondary,
                                                 onChanged: (newbool){
                                setState(() {
                                  DiabetesCheck=newbool!;
                                });
                                                 }
                                                 ),
                                     ],
                                   ),
                               
                                     Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(right:7.0),
                                         child: Text('Hypertension',style: TextStyle(
                                           fontSize: 20,fontWeight: FontWeight.w500,color: color.secondary
                                         ),),
                                       ),
                                         
                                           Checkbox(value: HypertensionCheck, 
                                                 activeColor: color.secondary,
                                                 onChanged: (newbool){
                                setState(() {
                                  HypertensionCheck=newbool!;
                                });
                                                 }
                                                 ),
                                     ],
                                   ),
                             ],
                           ),
                           
                            Column(
                             children: [
                               Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(right:7.0),
                                         child: Text('Asthma',style: TextStyle(
                                           fontSize: 20,fontWeight: FontWeight.w500,color: color.secondary
                                         ),),
                                       ),
                                         
                                           Checkbox(value: AsthmaCheck, 
                                                 activeColor: color.secondary,
                                                 onChanged: (newbool){
                                setState(() {
                                  AsthmaCheck=newbool!;
                                });
                                                 }
                                                 ),
                                     ],
                                   ),
                               
                                     Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(right:7.0),
                                         child: Text('HIV/AIDs',style: TextStyle(
                                           fontSize: 20,fontWeight: FontWeight.w500,color: color.secondary
                                         ),),
                                       ),
                                         
                                           Checkbox(value: HIVCheck, 
                                                 activeColor: color.secondary,
                                                 onChanged: (newbool){
                                setState(() {
                                  HIVCheck=newbool!;
                                });
                                                 }
                                                 ),
                                     ],
                                   ),
                             ],
                           ),
                         ],
                       ),
                     ),
        
                     UpdatedTextfield(hintText: '',
                                           controller: Surnamecontroller,
                                            contentPadding: EdgeInsets.only(top: 5,left: 16.0), 
                                            height: 70, 
                                            width: MediaQuery.of(context).size.width,
                                             text:'Any Other Health Condition' ),

                                             Padding(
                                               padding: const EdgeInsets.only(bottom: 20.0),
                                               child: UpdatedTextfield(hintText: 'eg. 0545595932',
                                                                                        controller: Surnamecontroller,
                                                                                         contentPadding: EdgeInsets.only(top: 5,left: 16.0), 
                                                                                         height: 55, 
                                                                                         width: MediaQuery.of(context).size.width,
                                                                                          text:'Contact' ),
                                             ),
                                     
                     Padding(
                                     padding: const EdgeInsets.only(bottom:25.0),
                                     child: Container(
                                    height: 55, //
                                    width: MediaQuery.of(context).size.width, 
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Proceed To AI',
                                        style: TextStyle(
                                     fontSize: 18,
                                     fontWeight: FontWeight.w500,
                                     color:color.secondary,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: color.primary,
                                        shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                   ),
          
            
           ] ),),
      ),);
  }
}