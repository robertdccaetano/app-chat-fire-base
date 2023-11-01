import 'package:app_chat_fire_base/core/services/auth/auth_mock_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chat page'),
            TextButton(
              onPressed: () => AuthMockService().logout(),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
