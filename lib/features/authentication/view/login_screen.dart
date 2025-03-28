import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  bool _showPass = false;

  void _toggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: screenHeight * .2),
              Text("Login", style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 32),
              _buildLoginField("Email", _emailTEC),
              const SizedBox(height: 20),
              _buildLoginField("Password", _passwordTEC),
              const SizedBox(height: 32),
              ElevatedButton(onPressed: () {}, child: Text("Login")),
              const SizedBox(height: 32),
              _buildDivider(context),
              const SizedBox(height: 32),
              _buildSignInWithGoogleButton(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't Have Account?",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  OutlinedButton _buildSignInWithGoogleButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.google),
          const SizedBox(width: 10),
          Text("Sign In With Google"),
        ],
      ),
    );
  }

  Row _buildDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Text("Or", style: Theme.of(context).textTheme.titleSmall),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildLoginField(String label, TextEditingController controller) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        suffixIcon:
            label == "Password"
                ? IconButton(
                  onPressed: _toggleShowPass,
                  icon: _showPass ? Icon(Iconsax.eye) : Icon(Iconsax.eye_slash),
                )
                : null,
      ),

      obscureText: label == "Password" && !_showPass ? true : false,
      controller: controller,
      validator: (String? value) {
        if (value?.trim().isEmpty ?? true) {
          return "$label can't be empty";
        } else {
          null;
        }
      },
    );
  }
}
