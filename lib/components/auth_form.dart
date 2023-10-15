import 'package:app_chat_fire_base/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _authFormData = AuthFormData();

  void _submit() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (_authFormData.isSignup)
                  TextFormField(
                    key: ValueKey('name'),
                    initialValue: _authFormData.name,
                    onChanged: (value) => _authFormData.name = value,
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                TextFormField(
                  key: ValueKey('email'),
                  initialValue: _authFormData.email,
                  onChanged: (value) => _authFormData.email = value,
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                TextFormField(
                  key: ValueKey('password'),
                  initialValue: _authFormData.password,
                  onChanged: (value) => _authFormData.password = value,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_authFormData.isLogin ? 'Entrar' : 'Cadastrar'),
                ),
                TextButton(
                  child: Text(_authFormData.isLogin
                      ? 'Criar uma nova conta?'
                      : 'Já possui conta?'),
                  onPressed: () {
                    setState(() {
                      _authFormData.toogleAuthMode();
                    });
                  },
                ),
              ],
            )),
      ),
    );
  }
}
