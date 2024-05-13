import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signUp';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController NameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     final color = Theme.of(context).colorScheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0,top: 70),
                child: Text('Register',
                 style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.w500
                 ),),
              ),
          
               customTextfield(hintText: 'Name',
               height: 50,
               width: MediaQuery.of(context).size.width,
                controller: NameController, 
               contentPadding: EdgeInsets.only(top: 5,left: 16.0)),
        
               customTextfield(hintText: 'Email',
               height: 50,
               width: MediaQuery.of(context).size.width,
                controller: Emailcontroller, 
               contentPadding: EdgeInsets.only(top: 5,left: 16.0)),
        
                  customTextfield(hintText:' Password',
                  height: 50,
               width: MediaQuery.of(context).size.width, 
                  controller: passwordController, 
                  contentPadding: EdgeInsets.only(top: 5,left: 16.0)),
        
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text('The password should be at least 6 characters long',
                style: TextStyle(color:color.tertiary,
                fontWeight: FontWeight.w400, fontSize:15),),
              ),
        
              Padding(
                padding: const EdgeInsets.only(bottom:25.0),
                child: Container(
                                  height: 50, //
                                  width: MediaQuery.of(context).size.width, 
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color:color.onPrimary,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: color.primary,
                                      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                  ),
                                ),
              ),
        
            Padding(
              padding: const EdgeInsets.only(bottom:25.0),
              child: Row(
                children: [
                  Container(height:1.0,
                  width: MediaQuery.of(context).size.width*0.4,
                  color: Colors.grey,),
              
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                    child: Text(
                           'Or',
                           style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: color.tertiary,
                                          ),
                                        ),
                  ),
              
              Container(height:1.0,
                                 width: MediaQuery.of(context).size.width*0.4,
                                 color: Colors.grey,),
                ],
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(bottom:20.0),
              child: GestureDetector(
                onTap:(){},
                child: Container(padding: EdgeInsets.all(8.0),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: color.onBackground, width: 1.0),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset('assets/Google.jpg',),
                
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text('Continue with Google',
                          style: TextStyle(color:color.secondary, fontSize: 18,
                          fontWeight: FontWeight.w400),),
                        )
                      ],
                    ),
                  ),
                  
                ),
              ),
            ),
        
             GestureDetector(
              onTap:(){},
              child: Container(padding: EdgeInsets.all(8.0),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: color.onBackground, width: 1.0),
                ),
                child: Center(
                  child: Row(
                    children: [
                       Image.asset('assets/facebook.jpg',),
              
                      Padding(
                        padding: const EdgeInsets.only(left:16.0),
                        child: Text('Continue with Facebook',
                        style: TextStyle(color:color.secondary, fontSize: 18,
                        fontWeight: FontWeight.w400),),
                      )
                    ],
                  ),
                ),
                
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}