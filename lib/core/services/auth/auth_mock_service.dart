import 'dart:async';
import 'dart:math';

import 'package:app_chat_fire_base/core/models/chat_user.dart';
import 'dart:io';

import 'package:app_chat_fire_base/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = ChatUser(
    id: '1',
    name: 'Teste',
    email: 'teste@teste.com.br',
    imageUrl: 'assets/images/avatar.png',
  );

  static Map<String, ChatUser> _users = {
    _defaultUser.email: _defaultUser,
  };
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;

  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> signUp(
      String name, String email, String password, File? image) async {
    final newUser = ChatUser(
        id: Random().nextDouble().toString(),
        name: name,
        email: email,
        imageUrl: image?.path ?? 'assets/images/avatar.png');

    // Insere na lista/Map se ausente
    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  // TODO: implement userChanges
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
