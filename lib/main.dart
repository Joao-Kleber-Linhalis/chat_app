import 'package:chat_app/core/services/notification/chat_notification_service.dart';
import 'package:chat_app/screen/auth_or_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          dialogBackgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blue,
            secondary: Colors.deepOrange,
            background: Colors.white,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home: AuthOrAppScreen(),
      ),
    );
  }
}
