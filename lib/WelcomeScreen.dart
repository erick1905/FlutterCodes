import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;

  WelcomeScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenida'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('¡Bienvenido, $username!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Puedes agregar lógica para realizar acciones específicas en esta vista.
              },
              child: Text('Ingresaste al siguiente form'),
            ),
          ],
        ),
      ),
    );
  }
}
