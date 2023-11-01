import 'package:app_chat_fire_base/core/models/chat_user.dart';
import 'package:app_chat_fire_base/core/services/auth/auth_mock_service.dart';
import 'package:app_chat_fire_base/pages/auth_page.dart';
import 'package:app_chat_fire_base/pages/chat_page.dart';
import 'package:app_chat_fire_base/pages/loading_page.dart';
import 'package:flutter/material.dart';

class AuthOrAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthMockService().userChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        },
      ),
    );
  }
}
