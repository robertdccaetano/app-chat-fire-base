import 'package:app_chat_fire_base/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: AuthForm(),
        ),
      ),
    );
  }
}
