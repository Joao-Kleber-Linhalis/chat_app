import 'package:chat_app/core/services/auth/auth_mock_service.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chat page"),
            TextButton(
              onPressed: (){
                AuthMockService().logout();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
