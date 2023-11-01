import 'package:app_chat_fire_base/pages/auth_or_app_page.dart';
import 'package:app_chat_fire_base/pages/auth_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthOrAppPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
