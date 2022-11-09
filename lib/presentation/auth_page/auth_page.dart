import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    Key? key,
    required this.authed,
  }) : super(key: key);

  final bool authed;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auth page"),
      ),
      body: Center(
          child: widget.authed
              ? Image.asset("assets/images/success.png")
              : Image.asset("assets/images/failed.png")),
    );
  }
}
