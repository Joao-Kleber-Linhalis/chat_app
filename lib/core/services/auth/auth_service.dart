import 'dart:io';

import 'package:chat_app/core/models/chat_user.dart';
import 'package:chat_app/core/services/auth/auth_firebase_service.dart';

abstract class AuthService {
  ChatUser? get currentUser; //Pegar usuario atual

  Stream<ChatUser?> get userChanges; //Perceber mudanças no usuario

  Future<void> signup(
    String nome,
    String email,
    String password,
    File? image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

  factory AuthService(){
    // return AuthMockService();
    return AuthFirebaseService();
  }
}
