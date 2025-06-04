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


]
 );
