import 'package:flutter/material.dart';

class BiometricAuthPage extends StatelessWidget {
  const BiometricAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(child: Text('Authenticate'), onPressed: () {}),
        ),
      ),
    );
  }
}
