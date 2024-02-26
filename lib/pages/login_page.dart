import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //textediting controllers

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
// sign user in method
  void signUserIn(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lock Logo
            const SizedBox(
              height: 50,
            ),
            const Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Welcome Back you\'ve been missed ',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),

            // Username Textfield
            MyTextField(
              controller: usernameController,
              hintText: "Username",
              obscureText: true,
            ),

            const SizedBox(
              height: 10,
            ),
            // Password Textfield
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: false,
            ),
            const SizedBox(height: 10,),
            //Forgot Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password',
                  style: TextStyle(color: Colors.grey[600]),),
                ],
              ),
            ),

            const SizedBox(height: 25,),
            //Sign In Button
            MyButton(onTap: signUserIn,),

            const SizedBox(height: 50,),
            //Or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: Text('Or continnue with', style: TextStyle(color: Colors.grey[700]),),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50,),
            // Google Sign In Button
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               //google button 
            SquareTile(imagePath: 'lib/images/google.png'),

            SizedBox(width: 25,),

            // apple button
           SquareTile(imagePath: 'lib/images/apple.png')
            ],),

            const SizedBox(height: 50,),
            //not a member? Register 

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Not a member?', style:  TextStyle(
                color: Colors.grey[70]
              ),),
              const SizedBox(width: 4,),
              const Text('Register now ', style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold
              ),)
            ],)
           
          ],
        ),
      )),
    );
  }
}
