import 'package:chat_app/core/services/auth/auth_service.dart';
import 'package:chat_app/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewMenssage extends StatefulWidget {
  const NewMenssage({super.key});

  @override
  State<NewMenssage> createState() => _NewMenssageState();
}

class _NewMenssageState extends State<NewMenssage> {
  String _message = '';
  final _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;

    if (user != null) {
      final msg = await ChatService().save(_message, user);
      print(msg?.id);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            onChanged: (msg) => setState(() => _message = msg),
            decoration: InputDecoration(
              labelText: "Enviar mensagem...",
            ),
            onSubmitted: (_){
              if(_message.trim().isNotEmpty){
                _sendMessage();
              }
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: _message.trim().isEmpty ? null : _sendMessage,
        ),
      ],
    );
  }
}
