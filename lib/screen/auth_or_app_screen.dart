import 'package:chat_app/core/models/chat_user.dart';
import 'package:chat_app/core/services/auth/auth_service.dart';
import 'package:chat_app/screen/auth_screen.dart';
import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/screen/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/firebase_options.dart';

class AuthOrAppScreen extends StatelessWidget {
  const AuthOrAppScreen({super.key});

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        } else {
          return StreamBuilder<ChatUser?>(
            stream: AuthService().userChanges,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingScreen();
              } else {
                return snapshot.hasData ? ChatScreen() : AuthScreen();
              }
            },
          );
        }
      },
    );
  }
}
