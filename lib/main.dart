import 'package:flutter/material.dart';
import 'WelcomeScreen.dart'; // Importa la nueva vista
void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String login = '';
  String password = '';
  bool authorized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  login = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Login',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (login == 'usuario' && password == 'contraseña') {
                  setState(() {
    authorized = true;
  });
  _showAuthorizationDialog(context, true);

  // Navegar a la vista de bienvenida
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => WelcomeScreen(username: login),
    ),
  );
                } else {
                  _showAuthorizationDialog(context, false);
                }
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAuthorizationDialog(BuildContext context, bool authorized) async {
    String message = authorized ? 'Usuario autorizado' : 'Usuario no autorizado';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado de la autorización'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (!authorized) {
                  setState(() {
                    login = '';
                    password = '';
                  });
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

