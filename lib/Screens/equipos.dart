import 'package:flutter/material.dart';
import 'package:myapp/entities/class.dart';

class EquiposScreen extends StatelessWidget {
  static const String name = 'equipos';
  const EquiposScreen({ super.key,}); // ← Esto permite usar `const EquiposScreen()`

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tus datos')),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(teams[index].teamName),
              subtitle: Image.network(teams[index].teamImage,width:100,
               height:150,
              fit: BoxFit.cover 
),
            ),
          );
        },
      ),
    );
  }
}
