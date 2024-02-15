import 'package:chat_app/components/auth_form.dart';
import 'package:chat_app/core/models/auth_form_data.dart';
import 'package:chat_app/core/services/auth/auth_mock_service.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);
      if (formData.isLogin) {
        //Login
        await AuthMockService().login(formData.email, formData.password);
      } else {
        //Cadastrar
        await AuthMockService().signup(
          formData.name,
          formData.email,
          formData.password,
          formData.image
        );
      }
    } catch (error) {
      //Tratar error
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(onSubmit: _handleSubmit),
            ),
          ),
          if (_isLoading)
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
