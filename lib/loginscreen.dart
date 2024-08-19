import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_lover/MainScreen.dart';
import 'package:ui_lover/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState(); // State class name matches
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 40, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom(context)),
            // Pass context for width
          ],
        ),
      ),
    );
  }
  Widget _buildTop() {
    return  SizedBox(
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff43e97b),
                    Color(0xff96e6a1),
                  ],
                ),
                shape: BoxShape.circle,
              ),
            ),
            Text(
              'UiLover',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
    );
  }


  Widget _buildBottom(BuildContext context) {
    // Added context to access screen width
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Make width match the screen width
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.green,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20,),
        _buildGreyText('UserName'),
        _buildTextField(textController, placeholder: 'Enter Your Username'),
        SizedBox(height: 40,),
        _buildGreyText('Password'),
        _buildTextField(passwordController, isPassword: true,
            placeholder: 'Enter Your Password'),
        SizedBox(height: 20,),
        _buildOtherLogin(),
        SizedBox(height: 20,),
        _buildSignUpText(), // Modified function for clickable sign-up text
        SizedBox(height: 20,),
        _buildLoginButton()
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.green,
      ),
    );
  }

  Widget _buildBlackText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,  // Set the text color to black
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller,
      {bool isPassword = false, required String placeholder}) {
    return Column(
      children: [
        TextField(
          controller: controller,
          obscureText: isPassword, // Handle password field
          decoration: InputDecoration(
            hintText: placeholder, // Use placeholder text here
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()), // Navigate to MainScreen
        );
      },
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        elevation: 20,
        minimumSize: Size.fromHeight(60),
        backgroundColor: Colors.green,
      ),
      child: Text('Login',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildBlackText('OR'),
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7, // Constrain the width to 70% of the screen width
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/download.png", width: 40, height: 40),
                Image.asset("assets/images/twitter.png", width: 40, height: 40),
                Image.asset("assets/images/facebook.jpg", width: 40, height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpText() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen()), // Navigate to SignUpScreen
          );
        },
        child: Text(
          "Don't have an account? Sign up",
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline, // Optional: underline text for emphasis
          ),
        ),
      ),
    );
  }
}


