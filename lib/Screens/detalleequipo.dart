import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/class.dart';
import 'package:myapp/providers.dart';

class DetalleEquipoScreen extends ConsumerWidget {
  static const String name = 'detalle';

  const DetalleEquipoScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final equipo = ref.watch(equiposeleccionadoProvider);
    final eliminar = '';
    return Scaffold(
      appBar: AppBar(title: Text(equipo.teamName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              equipo.descripcion,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
 Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton.icon(
      onPressed: () {
        context.push('/editarequipo');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      icon: const Icon(Icons.edit),
      label: const Text('Editar'),
    ),
    const SizedBox(width: 16), 
    ElevatedButton.icon(
      onPressed: () {
        final equiposActuales = [...ref.read(teamsProvider)];
        equiposActuales.remove(equipo);
        ref.read(teamsProvider.notifier).state = equiposActuales;
        context.go('/equipos');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      icon: const Icon(Icons.delete),
      label: const Text('Eliminar'),
    ),
  ],
),
          ],
        ),
      ),
    );
  }
}
