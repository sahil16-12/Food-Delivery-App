import 'package:flutter/material.dart';
import 'package:flutterproject/components/my_button.dart';
import 'package:flutterproject/components/my_textfield.dart';
import 'package:flutterproject/services/auth/auth_service.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
  void login() async
  {
      final _authService = AuthService();
     //try sign in
      try{
        await _authService.signInWithEmailPassword(emailController.text, passwordController.text,);
      }
     //display any errrors
      catch(e){
        showDialog(context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
                Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),
            //message, app slogan

            Text(
              "Hungry.com",
              style: TextStyle(
                fontSize: 23,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            //email textfield
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 10),

            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),


            //sign in button
            MyButton(
                onTap: login,
                text: "Sign in"
            ),
            const SizedBox(height: 25),


            //not a member? register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
}
