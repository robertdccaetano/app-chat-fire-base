import 'package:app_chat_fire_base/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SingleChildScrollView(
          // A comunicação indireta ocorre quando o componente Filho "AuthForm"
          // precisa passar informações pro comp. pai quando ocorre alguma
          // ação dentro dele/filho, e isso só pode ser feito quando o comp.
          // pai passa uma função que é recebida no construtor do comp.
          // filho
          child: AuthForm(),
        ),
      ),
    );
  }
}
