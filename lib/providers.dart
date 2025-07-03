import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/entities/class.dart';
StateProvider <List> teamsProvider = StateProvider<List>((ref) => teams);
StateProvider <String> equipoIngresado = StateProvider<String>((ref) => '');
StateProvider <String> imagenIngresada = StateProvider<String>((ref) => '');
StateProvider <String> descripcionIngresada = StateProvider<String>((ref) => '');