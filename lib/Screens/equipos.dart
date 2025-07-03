import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers.dart';

class EquiposScreen extends ConsumerWidget {
  static const String name = 'equipos';
  const EquiposScreen({
    super.key,
  }); 

  @override
  Widget build(BuildContext context,ref) {
     final teams = ref.watch(teamsProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Lista de equipos')),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(teams[index].teamName),
              leading: Image.network(
                teams[index].teamImage,
                width: 70,
                height: 50,
                fit: BoxFit.cover,
          ),
            onTap: () {
              ref.read(equiposeleccionadoProvider.notifier).state = teams[index];
                context.push('/detalle',);
              },
            ),
          ); // 
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          context.push('/addequipo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}