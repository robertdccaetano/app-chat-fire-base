import 'package:app_chat_fire_base/components/auth_form.dart';
import 'package:app_chat_fire_base/core/models/auth_form_data.dart';
import 'package:app_chat_fire_base/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);

      if (formData.isLogin) {
        // Login
        await AuthService().login(
          formData.email,
          formData.password,
        );
      } else {
        print('signup');
        await AuthService().signUp(
            formData.name, formData.email, formData.password, formData.image!);
      }
    } catch (error) {
      // Tratar erro
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              // A comunicação indireta ocorre quando o componente Filho "AuthForm"
              // precisa passar informações pro comp. pai quando ocorre alguma
              // ação dentro dele/filho, e isso só pode ser feito quando o comp.
              // pai passa uma função que é recebida no construtor do comp.
              // filho
              child: AuthForm(onSubmit: _handleSubmit),
            ),
          ),
          if (_isLoading)
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
