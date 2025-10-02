import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  static const String name = 'login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controladorUsuario = TextEditingController();
  TextEditingController controladorContrasena = TextEditingController();

  String mensaje = '';
  Color colorMensaje = Colors.black;

  void login() {
    final usuarioingresado = controladorUsuario.text;
    final contrasenaingresada = controladorContrasena.text;

    setState(() {
      if (usuarioingresado.isEmpty || contrasenaingresada.isEmpty) {
        mensaje = 'Debes completar ambos campos';
        colorMensaje = Colors.red;
      } else {
        // Navegar a HomeScreen sin pasar usuario
        context.push('/equipos');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controladorUsuario,
                decoration: const InputDecoration(labelText: 'Usuario'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controladorContrasena,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: login,
                child: const Text('Iniciar sesión'),
              ),
              const SizedBox(height: 20),
              Text(
                mensaje,
                style: TextStyle(color: colorMensaje, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
