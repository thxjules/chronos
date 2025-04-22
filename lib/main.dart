import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/inicio.dart';
import 'package:chronos/pag2.dart';
import 'package:chronos/pages/conceptos.dart';
import 'package:chronos/pages/gatopage.dart';
import 'package:chronos/pages/desencriptacion.dart';
import 'package:chronos/pages/perfile_page.dart';
import 'package:chronos/pages/usuarios_json_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.exo2TextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/inicio': (context) => const Iniciopage(),
        '/conceptos': (context) => const ConceptosPage(),
        '/gato': (context) => const Gatopage(),
        '/explora': (context) => const Pag2(),
        '/desencriptacion': (context) => const DesencriptacionPage(), 
        '/perfil': (context) => const PerfilPage(), 
        '/usuarios_json': (context) => UsuariosJsonScreen(),
            
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fondo2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: Text(
                      '¿Te interesa la física cuántica y el universo?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.exo2(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  customButton('Explora', const Color(0xFFC6AFEF), () {
                    Navigator.pushNamed(context, '/explora');
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton(String text, Color bgColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: GoogleFonts.orbitron(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text),

    );
  }
}
