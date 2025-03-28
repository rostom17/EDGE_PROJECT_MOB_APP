import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
              SizedBox(height: screenHeight * .33),
              Text("Login"),
              const SizedBox(height: 20),
              _buildLoginField("Email", _emailTEC),
              const SizedBox(height: 20),
              _buildLoginField("Password", _passwordTEC),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
        child: ElevatedButton(onPressed: () {}, child: Text("Login")),
      ),
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
