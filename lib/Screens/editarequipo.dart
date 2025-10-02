import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/class.dart';
import 'package:myapp/providers.dart';

class EditarEquipo extends ConsumerWidget {
  static const String name = 'Editarequipo';

  const EditarEquipo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipo = ref.watch(equiposeleccionadoProvider);

    TextEditingController controladorNombre =
        TextEditingController(text: equipo.teamName);
    TextEditingController controladorImagen =
        TextEditingController(text: equipo.teamImage);
    TextEditingController controladorDescripcion =
        TextEditingController(text: equipo.descripcion);

    return Scaffold(
      appBar: AppBar(title: Text('Editar ${equipo.teamName}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controladorNombre,
              decoration: const InputDecoration(labelText: 'Nombre del equipo'),
            ),
            TextField(
              controller: controladorImagen,
              decoration: const InputDecoration(labelText: 'Imagen del equipo'),
            ),
            TextField(
              controller: controladorDescripcion,
              decoration: const InputDecoration(labelText: 'Descripción del equipo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final name = controladorNombre.text.trim();
                final imagen = controladorImagen.text.trim();
                final descripcion = controladorDescripcion.text.trim();

                if (name.isEmpty || imagen.isEmpty || descripcion.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No completaste todas las casillas'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  final equipoActualizado = Equiposeuropeos(
                    teamName: name,
                    teamImage: imagen,
                    descripcion: descripcion,
                  );

                  // Guardar en Firestore con el provider
                  await ref.read(teamsProvider.notifier).updateTeam(
                        ref.read(equiposeleccionadoProvider),
                        equipoActualizado,
                      );

                  // Actualizar el seleccionado localmente
                  ref.read(equiposeleccionadoProvider.notifier).state = equipoActualizado;

                  // Volver a la lista
                  context.push('/equipos');
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}