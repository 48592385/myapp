import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/class.dart';


class LoginScreen extends StatefulWidget {

  static const String name ='login';

    const LoginScreen({super.key});
    
  @override
    State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controladorUsuario = TextEditingController();
  TextEditingController controladorContrasena = TextEditingController();
List <Usuario> usuarios = [
Usuario('juan', 'garcia', 'jufre', 25),
Usuario('María', 'clave456', 'Av. Rivadavia 2020', 30),
Usuario('Pedro', 'segura789', 'Calle Mitre 456', 22),
Usuario('Lucía', 'pass321', 'Av. Belgrano 1500', 28),
Usuario('Carlos', 'contraseña999', 'San Martín 800', 35),
];
  String mensaje = '';
  Color colorMensaje = Colors.black;
 


  void login (){
   String usuarioingresado =  controladorUsuario.text;
   String contrasenaingresada =  controladorContrasena.text;
   Usuario usuarioElegido;
   
   
      
 setState(() {
bool verifica = usuarios.any(
  (usuario) => usuario.name == usuarioingresado &&
usuario.password == contrasenaingresada
);

if(verifica){
usuarioElegido = usuarios.firstWhere(
  (usuario) => usuario.name == usuarioingresado &&
usuario.password == contrasenaingresada
);
  context.push('/equipos');
  
}

 else {
      mensaje = 'Tu usuario o contraseña está mal';
      colorMensaje = Colors.red;
    }
  

if (usuarioingresado.isEmpty|| contrasenaingresada.isEmpty){
 mensaje ='te falta completar alguna casilla';
 colorMensaje = Colors.red;
  }
  }
  );
  }
  
 




  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Login')),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controladorUsuario,
              decoration: const InputDecoration(
                labelText: 'Usuario',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controladorContrasena,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text('Iniciar sesión'),
            ),
            const SizedBox(height: 20),
            Text(
              mensaje,
              style: TextStyle(color: colorMensaje, fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );
}
}