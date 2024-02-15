import 'package:chat_app/core/models/chat_user.dart';
import 'package:chat_app/core/services/auth/auth_mock_service.dart';
import 'package:chat_app/screen/auth_screen.dart';
import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/screen/loading_screen.dart';
import 'package:flutter/material.dart';

class AuthOrAppScreen extends StatelessWidget {
  const AuthOrAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthMockService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else {
            return snapshot.hasData ? ChatScreen() : AuthScreen();
          }
        },
      ),
    );
  }
}
