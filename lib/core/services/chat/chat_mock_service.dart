import 'dart:async';
import 'dart:math';

import 'package:chat_app/core/models/chat_message.dart';
import 'package:chat_app/core/models/chat_user.dart';
import 'package:chat_app/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'teste',
      createdAt: DateTime.now(),
      userId: '1',
      userName: 'teste',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'MIAUUUU',
      createdAt: DateTime.now(),
      userId: '111',
      userName: 'Gato',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '3',
      text: 'Au au au',
      createdAt: DateTime.now(),
      userId: '222',
      userName: 'Cachorro',
      userImageURL: 'assets/images/avatar.png',
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageUrl,
    );

    _msgs.add(newMessage);

    _controller?.add(_msgs.reversed.toList());
    return newMessage;
  }
}
