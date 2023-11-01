import 'dart:io';

import 'package:app_chat_fire_base/core/services/auth/auth_mock_service.dart';

import '../../models/chat_user.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> signUp(
    String name,
    String email,
    String password,
    File? image,
  );
  Future<void> login(String email, String password);
  Future<void> logout();

  // Vantagem desse construtor é que não necessariamente precisa retornar
  // uma instancia de AuthService, até por ser abastract, mas pode instanciar
  // classes subtipos dessa que herdam sua estrutura
  factory AuthService() {
    return AuthMockService();
    // Então por meio do construtor factory eu consigo retornar a instancia
    // de qualquer classe que é subtipo dela (AuthService), fazendo com que
    // eu altere meu código em 1 único lugar e todos os outros que usam o
    // AuthService já podem fazer uso da instancia do return desse construtor.
    // return AuthFirebaseService();
  }
}
