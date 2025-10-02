import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/entities/class.dart'; // tu modelo Equiposeuropeos

// Notifier para la lista de equipos usando Firestore
class TeamsNotifier extends StateNotifier<List<Equiposeuropeos>> {
  final FirebaseFirestore db;

  TeamsNotifier(this.db) : super([]);

  // Cargar todos los equipos desde Firestore
  Future<void> getAllTeams() async {
    try {
      final query = db.collection('equipos').withConverter<Equiposeuropeos>(
        fromFirestore: Equiposeuropeos.fromFirestore,
        toFirestore: (Equiposeuropeos team, _) => team.toFirestore(),
      );
      final snapshot = await query.get();
      state = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error al cargar equipos: $e');
    }
  }

  // Agregar un equipo nuevo
  Future<void> addTeam(Equiposeuropeos team) async {
    try {
      final doc = db.collection('equipos').doc();
      await doc.set(team.toFirestore());
      state = [...state, team];
    } catch (e) {
      print('Error al agregar equipo: $e');
    }
  }

Future<void> deleteTeam(Equiposeuropeos equipo) async {
  try {
    final query = await db
        .collection('equipos')
        .where('teamName', isEqualTo: equipo.teamName)
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      await query.docs.first.reference.delete();

      // Actualizar la lista local
      state = state.where((t) => t.teamName != equipo.teamName).toList();
    }
  } catch (e) {
    print('Error al eliminar equipo: $e');
  }
}
  // 🔹 Nuevo método: Actualizar equipo existente
  Future<void> updateTeam(
      Equiposeuropeos original, Equiposeuropeos actualizado) async {
    try {
      // Buscar el documento que coincide con el nombre original
      final query = await db
          .collection('equipos')
          .where('teamName', isEqualTo: original.teamName)
          .limit(1)
          .get();

      if (query.docs.isNotEmpty) {
        await query.docs.first.reference.update(actualizado.toFirestore());
      }

      // Refrescar el estado local
      state = state.map((t) {
        if (t.teamName == original.teamName) {
          return actualizado;
        }
        return t;
      }).toList();
    } catch (e) {
      print('Error al actualizar equipo: $e');
    }
  }
}

// Notifier para el equipo seleccionado
class EquiposeleccionadoNotifier extends StateNotifier<Equiposeuropeos> {
  EquiposeleccionadoNotifier()
      : super(Equiposeuropeos(
          teamName: '',
          teamImage: '',
          descripcion: '',
        ));
}

// Providers
final teamsProvider =
    StateNotifierProvider<TeamsNotifier, List<Equiposeuropeos>>(
  (ref) => TeamsNotifier(FirebaseFirestore.instance),
);

final equiposeleccionadoProvider =
    StateNotifierProvider<EquiposeleccionadoNotifier, Equiposeuropeos>(
  (ref) => EquiposeleccionadoNotifier(),
);

final equiposStreamProvider = StreamProvider<List<Equiposeuropeos>>((ref) {
  final db = FirebaseFirestore.instance.collection('equipos').withConverter<
      Equiposeuropeos>(
    fromFirestore: Equiposeuropeos.fromFirestore,
    toFirestore: (team, _) => team.toFirestore(),
  ).snapshots();

  return db.map((snapshot) =>
      snapshot.docs.map((doc) => doc.data()).toList());
});
