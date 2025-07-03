import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/class.dart';

class AddEquipoScreen extends ConsumerWidget {
  static const String name = 'addEquipo';
  const AddEquipoScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    String name = '';
    String imagen = '';
    String descripcion = '';
    TextEditingController controladorNombre = TextEditingController();
    TextEditingController controladorImagen = TextEditingController();
    TextEditingController controladorDescripcion = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Jugador')),
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
              decoration: const InputDecoration(
                labelText: 'Descripción del equipo',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final name = controladorNombre.text;
          final imagen = controladorImagen.text;
          final descripcion = controladorDescripcion.text;
          if (imagen.isEmpty) {
            controladorImagen.text =
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFQdGYCwWZp_ZleagUa8Gp3fu4QhqdBteEBA&s';
            final imagen = controladorImagen.text;
            teams.add(
              Equiposeuropeos(
                teamName: name,
                teamImage: imagen,
                descripcion: descripcion,
              ),
            );
            context.push('/equipos');
          } else {
            teams.add(
              Equiposeuropeos(
                teamName: name,
                teamImage: imagen,
                descripcion: descripcion,
              ),
            );
            context.push('/equipos');
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
