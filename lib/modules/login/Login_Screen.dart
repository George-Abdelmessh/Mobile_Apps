import 'package:app00/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool hidePass = true;
  var formKey = GlobalKey <FormState> ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login Page',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  defaultFormFirld(
                    controller: emailController,
                    labelText: 'Email Address',
                    type: TextInputType.emailAddress,
                    prefix: Icons.email,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Email address must be not null';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  defaultFormFirld(
                    controller: passwordController,
                    labelText: 'Password',
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock,
                    suffix: hidePass? Icons.visibility : Icons.visibility_off,
                    suffixPressed: (){
                      setState(() {
                        hidePass = !hidePass;
                      });
                    },
                    obscureText: hidePass,
                    validate: (value){
                      if(value!.isEmpty){
                        return 'Password must be not null';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: 'login',
                    method: (){
                      if(formKey.currentState!.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      } },
                    //function: (){print('gg');},
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                      ),
                      TextButton(
                          onPressed: (){
                            print("Register");
                          },
                          child: Text(
                            'Register Now!',
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
