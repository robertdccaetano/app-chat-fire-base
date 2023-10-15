import 'package:app_chat_fire_base/pages/loading_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
