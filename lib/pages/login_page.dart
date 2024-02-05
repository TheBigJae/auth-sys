import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_textfield.dart';
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
          children: [
            // Lock Logo
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.lock,
              size: 100,
            ),
            SizedBox(
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
            SizedBox(height: 10,),
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

            SizedBox(height: 25,),
            //Sign In Button
            MyButton(onTap: signUserIn,),

            SizedBox(height: 50,),
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
            // Google Sign In Button
            Row(children: [
               //google button 
            
            // apple button
            ],)
           
          ],
        ),
      )),
    );
  }
}
