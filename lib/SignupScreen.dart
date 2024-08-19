import 'package:flutter/material.dart';
import 'MainScreen.dart'; // Import the MainScreen

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff43e97b),
                  Color(0xff96e6a1),
                ],
              ),
              shape: BoxShape.circle,
            ),
          ),
          const Text(
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: const RoundedRectangleBorder(
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
        const Center(
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.green,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGreyText('FirstName'),
                  _buildTextField(firstNameController, placeholder: 'Your FirstName'),
                ],
              ),
            ),
            const SizedBox(width: 10), // Space between FirstName and LastName fields
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGreyText('LastName'),
                  _buildTextField(lastNameController, placeholder: 'Your LastName'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildGreyText('UserName'),
        _buildTextField(userNameController, placeholder: 'Enter Your Username'),
        const SizedBox(height: 10),
        _buildGreyText('Password'),
        _buildTextField(passwordController, isPassword: true, placeholder: 'Enter Your Password'),
        const SizedBox(height: 10),
        _buildGreyText('Date of Birth'),
        _buildTextField(dateController, placeholder: 'Enter Your Date of Birth'),
        const SizedBox(height: 20),
        _buildSignupButton(),
        const SizedBox(height: 20),
        _buildSignUpText(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.green,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller,
      {bool isPassword = false, required String placeholder}) {
    return TextField(
      controller: controller,
      obscureText: isPassword, // Handle password field
      decoration: InputDecoration(
        hintText: placeholder, // Use placeholder text here
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildSignupButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()), // Navigate to MainScreen
        );
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        minimumSize: const Size.fromHeight(60),
        backgroundColor: Colors.green,
      ),
      child: const  Text(
        'Sign up',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSignUpText() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context); // Go back to the previous screen (LoginScreen)
        },
        child: const Text(
          "Already have an account? Login",
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
