import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/Login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController Emailcontroller= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    final color= Theme.of(context).colorScheme;
    return Scaffold(
       body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0,top: 70),
                child: Text('Login',
                 style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.w500
                 ),),
              ),
               customTextfield(hintText: 'Email',
                controller: Emailcontroller, 
               contentPadding: EdgeInsets.only(top: 5,left: 16.0)),
        
                  customTextfield(hintText:' Password', 
                  controller: passwordController, 
                  contentPadding: EdgeInsets.only(top: 5,left: 16.0)),
        
              Padding(
                padding: const EdgeInsets.only(bottom:25.0,top: 25.0),
                child: Container(
                                  height: 50, //
                                  width: MediaQuery.of(context).size.width, 
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Login',
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

              Align(alignment: Alignment.bottomRight,
                child: TextButton(onPressed: (){},
                   child:Text("Forgot Password?", style: TextStyle(color:color.onSecondary, fontSize: 17,
                          fontWeight: FontWeight.w500), ), ),
              ),
        

            Align(alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:4.0),
                    child: Text("Don't have an Account?", style: TextStyle(color:color.secondary, fontSize: 15,
                            fontWeight: FontWeight.w500), ),
                  ),
              
                  TextButton(onPressed: (){},
                   child:Text("Sign Up", style: TextStyle(color:color.onSecondary, fontSize: 15,
                          fontWeight: FontWeight.w500), ), )
                ],
              ),
            )
            ],
          ),
        ),
      ),
    
    );
  }
}