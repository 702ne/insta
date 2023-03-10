import 'package:flutter/material.dart';
import 'package:insta/const/common_size.dart';
import 'package:insta/homepage.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: common_l_gap),
                Image.asset('assets/images/insta_text_logo.png'),
                TextFormField(
                  cursorColor: Colors.black54,
                  controller: _emailController,
                  decoration: _textInputDecor('Email'),
                  validator: (text) {
                    if (text!.isNotEmpty && text.contains("@")) {
                      return null;
                    } else {
                      return 'Please enter your email correctly';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: common_s_gap),
                TextFormField(
                  cursorColor: Colors.black54,
                  controller: _passwordController,
                  decoration: _textInputDecor('Password'),
                  obscureText: true,
                  validator: (text) {
                    if (text!.isNotEmpty && text.length > 5) {
                      return null;
                    } else {
                      return 'Please enter your password correctly';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: common_s_gap),
                TextFormField(
                  cursorColor: Colors.black54,
                  controller: _cPasswordController,
                  decoration: _textInputDecor('Confirm Password'),
                  obscureText: true,
                  validator: (text) {
                    if (text!.isNotEmpty && text == _passwordController.text) {
                      return null;
                    } else {
                      return 'Please check your password correctly';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: common_gap,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    side: const BorderSide(width: 2, color: Colors.grey),
                  ),
                  child: const Text(
                    'Join',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Validation success!!!');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }

  InputDecoration _textInputDecor(String text) {
    return InputDecoration(
        hintText: text,
        enabledBorder: _activeInputBorder(),
        focusedBorder: _activeInputBorder(),
        errorBorder: _errorInputBorder(),
        focusedErrorBorder: _errorInputBorder(),
        filled: true,
        fillColor: Colors.grey[100]);
  }

  OutlineInputBorder _errorInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red[300]!),
        borderRadius: BorderRadius.circular(common_s_gap));
  }

  OutlineInputBorder _activeInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(common_s_gap));
  }
}
