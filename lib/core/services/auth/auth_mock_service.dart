import 'package:app_chat_fire_base/core/models/chat_user.dart';
import 'dart:io';

import 'package:app_chat_fire_base/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> login(String email, String password) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(
      String name, String email, String password, File image) async {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  // TODO: implement userChanges
  // Stream<ChatUser?> get userChanges {}
}
