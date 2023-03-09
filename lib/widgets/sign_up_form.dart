import 'package:flutter/material.dart';
import 'package:insta/const/common_size.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: common_l_gap),
            Image.asset('assets/images/insta_text_logo.png'),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(common_s_gap)),
                  filled: true,
                  fillColor: Colors.grey[100]),
            ),
            TextFormField(),
            TextFormField(),
          ],
        ));
  }
}
