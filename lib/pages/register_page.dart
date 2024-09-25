import 'package:flutter/material.dart';
import 'package:flutterproject/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  //register method
  void register() async{
    //get auth service
    final _authService = AuthService();

    //check if passswords match -> create user
    if(passwordController.text==confirmPasswordController.text){
      try{
        await _authService.signUpWithEmailPassword(
            emailController.text,
            passwordController.text,
        );
      }
      catch(e){
        showDialog(context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
        );
      }
    }
    //if passswords dont match -> error
    else{
      showDialog(context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords dont match!"),
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
            //mesage, app slogan

            Text(
              "Let's create an account for you",
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
            const SizedBox(height: 10),

            //confirm password textfield
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            //sign up button
            MyButton(
                onTap: register,
                text: "Sign Up"
            ),
            const SizedBox(height: 25),


            //Already have an account? Login now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now",style: TextStyle(
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
