import 'package:flutter/material.dart';
import 'package:myapp/entities/class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends ConsumerWidget {
  static const String name = 'home';

  final Usuario usuario;

  const HomeScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Tus datos')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bienvenido/a ${usuario.name}', style: TextStyle(fontSize: 30)),
          SizedBox(height: 40),
          Text(
            'Dirección: ${usuario.direccion}',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          Text('Edad: ${usuario.edad}', style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
