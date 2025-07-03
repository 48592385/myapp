import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/class.dart';
import 'package:myapp/providers.dart';

class AddEquipoScreen extends ConsumerWidget {
  static const String name = 'addEquipo';
  const AddEquipoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(equipoIngresado);
    final imagen = ref.watch(imagenIngresada);
    final descripcion = ref.watch(descripcionIngresada);
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
          if (name.isEmpty || imagen.isEmpty || descripcion.isEmpty) {
            Text(
              'No completaste todas las casillas',
              style: TextStyle(color: Colors.red),
            );         
          }
          else{
          teams.add(Equiposeuropeos(teamName: name, teamImage: imagen, descripcion: descripcion));
          context.push('/equipos');
          }
        },
          child:
          const Icon(Icons.add)
          
        
      ),
    );
  }
}
