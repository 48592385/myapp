import 'package:myapp/Screens/addequipo.dart';
import 'package:myapp/Screens/detalleequipo.dart';
import 'package:myapp/Screens/editarequipo.dart';
import 'package:myapp/Screens/equipos.dart';
import 'package:myapp/Screens/home.dart';
import 'package:myapp/Screens/login.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/class.dart';

final appRouter = GoRouter(routes: [
    GoRoute(
      name: LoginScreen.name,
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: HomeScreen.name,
    path: '/home',
    builder: (context, state) {
      final usuario = state.extra as Usuario;
      return HomeScreen(usuario: usuario);
    },
    ),
    GoRoute(name: EquiposScreen.name,
    path: '/equipos',
    builder: (context, state) => const EquiposScreen(),
    ),

    GoRoute(
      name: DetalleEquipoScreen.name,
      path: '/detalle',
      builder: (context, state) => DetalleEquipoScreen(),
        ),
GoRoute(
name: AddEquipoScreen.name,
path: '/addequipo',
builder: (context, state) =>const AddEquipoScreen(),
),
GoRoute(
  name: EditarEquipo.name,
  path: '/editarequipo',
   builder: (context, state) => const EditarEquipo(),
  )

  ],
);


