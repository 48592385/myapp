import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/class.dart';

class AddEquipoScreen extends ConsumerWidget {
  static const String name = 'addEquipo';
  const AddEquipoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controladorNombre = TextEditingController();
    final TextEditingController controladorImagen = TextEditingController();
    final TextEditingController controladorDescripcion = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Equipo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controladorNombre,
              decoration: const InputDecoration(labelText: 'Nombre del equipo'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controladorImagen,
              decoration: const InputDecoration(labelText: 'Imagen del equipo'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controladorDescripcion,
              decoration:
                  const InputDecoration(labelText: 'Descripción del equipo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = controladorNombre.text.trim();
          final imagen = controladorImagen.text.isEmpty
              ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFQdGYCwWZp_ZleagUa8Gp3fu4QhqdBteEBA&s'
              : controladorImagen.text.trim();
          final descripcion = controladorDescripcion.text.trim();

          if (name.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('El nombre no puede estar vacío')),
            );
            return;
          }

          final nuevoEquipo = Equiposeuropeos(
            teamName: name,
            teamImage: imagen,
            descripcion: descripcion,
          );

          await FirebaseFirestore.instance
              .collection('equipos')
              .add(nuevoEquipo.toFirestore());

          // Navegar a la lista de equipos
          if (context.mounted) {
            context.go('/equipos');
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
