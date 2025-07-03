import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/entities/class.dart';
StateProvider <List> teamsProvider = StateProvider<List>((ref) => teams);
StateProvider<Equiposeuropeos>equiposeleccionadoProvider = StateProvider<Equiposeuropeos>((ref) => Equiposeuropeos(
    teamName: '',
    teamImage: '',
    descripcion: '',
  ) );