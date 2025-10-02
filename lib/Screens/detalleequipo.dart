import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/class.dart';
import 'package:myapp/providers.dart';

class DetalleEquipoScreen extends ConsumerWidget {
  static const String name = 'detalle';

  const DetalleEquipoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipo = ref.watch(equiposeleccionadoProvider);

    return Scaffold(
      appBar: AppBar(title: Text(equipo.teamName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              equipo.descripcion,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
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
                  onPressed: () async {
                    try {
                      // Usamos deleteTeam que elimina directamente sin pedir ID
                      await ref
                          .read(teamsProvider.notifier)
                          .deleteTeam(equipo);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "${equipo.teamName} fue eliminado correctamente"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      context.go('/equipos');
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error al eliminar: $e"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
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
