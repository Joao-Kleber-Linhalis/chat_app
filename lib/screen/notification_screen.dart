import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Notificações"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Notificações"),
      ),
    );
  }
}
