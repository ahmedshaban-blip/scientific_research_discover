// ignore_for_file: file_names

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:scientific_research_discover/screens/Firist%20Screen/ArxivPaperScreen.dart';

class SignInScreenWidget extends StatelessWidget {
  final Widget? title;
  const SignInScreenWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    void onSignedIn() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }

    void onSignedup() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreenWidget()),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade300, Colors.indigo.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title ?? Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 3,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Flexible(
                    child: SignInScreen(
                      providers: [
                        EmailAuthProvider(),
                      ],
                      actions: [
                        AuthStateChangeAction<UserCreated>((context, state) {
                          onSignedup();
                        }),
                        AuthStateChangeAction<SignedIn>((context, state) {
                          onSignedIn();
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

