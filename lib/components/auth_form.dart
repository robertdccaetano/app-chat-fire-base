import 'dart:io';

import 'package:app_chat_fire_base/components/user_image_picker.dart';
import 'package:app_chat_fire_base/core/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({required this.onSubmit});
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _authFormData = AuthFormData();

  void _handleImagePick(File image) {
    _authFormData.image = image;
  }

  void _showErro(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    // if (_authFormData.image == null && _authFormData.isSignup) {
    //   return _showErro('Imagen não selecionada');
    // }

    widget.onSubmit(_authFormData);
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
                  UserImagePicker(onImagePick: _handleImagePick),
                if (_authFormData.isSignup)
                  TextFormField(
                    key: ValueKey('name'),
                    initialValue: _authFormData.name,
                    onChanged: (value) => _authFormData.name = value,
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (_name) {
                      final name = _name ?? '';
                      if (name.trim().length < 5) {
                        return 'Nome deve ter no mínimo 5 caracteres. ';
                      }

                      return null;
                    },
                  ),
                TextFormField(
                  key: ValueKey('email'),
                  initialValue: _authFormData.email,
                  onChanged: (value) => _authFormData.email = value,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  validator: (_email) {
                    final email = _email ?? '';
                    if (!email.contains('@')) {
                      return 'E-mail informado não é válido!';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  key: ValueKey('password'),
                  initialValue: _authFormData.password,
                  onChanged: (value) => _authFormData.password = value,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha'),
                  validator: (_password) {
                    final password = _password ?? '';
                    if (password.length < 6) {
                      return 'Senha deve ter no mínimo 6 caracteres';
                    }

                    return null;
                  },
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
