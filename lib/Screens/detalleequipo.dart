import 'package:flutter/material.dart';
import 'package:myapp/entities/class.dart';

class DetalleEquipoScreen extends StatelessWidget {
  static const String name = 'detalle';

   Equiposeuropeos equipo;

   DetalleEquipoScreen({super.key, required this.equipo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(equipo.teamName)),
      body: Center(
        child: Text(
          equipo.descripcion,
           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
          