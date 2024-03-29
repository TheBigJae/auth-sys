import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //textediting controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// sign user Up method
  void signUserUp() async {
    // LOADING CIRCLE
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //TRY CREATING USER
    try {
      //check if password is confrimed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        //show error message  Passowrd's don't match
        showErrorMessage("Passwords don't match");
      }
      //pop loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);

      //show error message
      showErrorMessage(e.code);
    }
  }

  // Error Message
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
              title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ));
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lock Logo
              const SizedBox(
                height: 25,
              ),
              const Icon(
                Icons.lock,
                size: 50,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Let\'s create an account for you',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),

              // Email Textfield
              MyTextField(
                controller: emailController,
                hintText: "Username",
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),
              // Password Textfield
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              // Confirm Password Textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),
             

              const SizedBox(
                height: 25,
              ),
              //Sign In Button
              MyButton(
                text: "Sign Up",
                onTap: signUserUp,
              ),

              const SizedBox(
                height: 50,
              ),
              //Or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continnue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
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

              const SizedBox(
                height: 50,
              ),
              // Google Sign In Button
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'lib/images/google.png'),

                  SizedBox(
                    width: 25,
                  ),

                  // apple button
                  SquareTile(imagePath: 'lib/images/apple.png')
                ],
              ),

              const SizedBox(
                height: 50,
              ),
              //not a member? Register

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have an account',
                    style: TextStyle(color: Colors.grey[70]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now ',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
