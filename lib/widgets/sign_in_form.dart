import 'package:flutter/material.dart';

import '../const/auth_input_decor.dart';
import '../const/common_size.dart';
import '../homepage.dart';
import 'or_divider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                  decoration: textInputDecor('Email'),
                  validator: (text) {
                    if (text!.isNotEmpty && text.contains("@")) {
                      return null;
                    } else {
                      return 'Please enter your email correctly';
                    }
                  },
                ),
                const SizedBox(height: common_s_gap),
                TextFormField(
                  cursorColor: Colors.black54,
                  controller: _passwordController,
                  decoration: textInputDecor('Password'),
                  obscureText: true,
                  validator: (text) {
                    if (text!.isNotEmpty && text.length > 5) {
                      return null;
                    } else {
                      return 'Please enter your password correctly';
                    }
                  },
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        print('btn Forgotten password pressed');
                      },
                      child: const Text(
                        "Forgotten Password",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )),
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
                    'Sign in',
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
                const SizedBox(
                  height: common_s_gap,
                ),
                const OrDivider(),
                TextButton.icon(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage('assets/images/facebook.png'),
                      color: Colors.blue,
                    ),
                    label: const Text(
                      "Login with Facebook",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            )),
      ),
    );
  }
}
