import 'package:flutter/material.dart';
import 'package:chronos/components/text_field.dart';
import 'package:chronos/database_helper.dart'; // Importar el helper de base de datos
import 'package:chronos/pages/inicio.dart';
import 'package:chronos/pages/register.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Si los campos están vacíos
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingrese todos los campos')),
      );
      return;
    }

    try {
      // Consultar la base de datos SQLite para verificar el usuario
      final user = await DatabaseHelper.instance.getUser(email, password);
      if (user != null) {
        // Si el usuario existe, iniciar sesión
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('¡Bienvenido de nuevo, $email!')),
        );
        // Redirigir a la página de inicio
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Iniciopage()),
        );
      } else {
        // Si el usuario no existe
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Correo o contraseña incorrectos')),
        );
      }
    } catch (e) {
      // Manejo de errores
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de inicio de sesión: $e')),
      );
    }
  }

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
                image: AssetImage("assets/fondo1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Contenido
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: DefaultTextStyle(
                  style: GoogleFonts.exo2(color: Colors.white), // Texto base
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(
                        'assets/logo2.png',
                        height: 250,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        '¡Te extrañamos!',
                        style: GoogleFonts.orbitron(
                          color: const Color(0xFFC6AFEF),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),
                      MyTextField(
                        controller: emailController,
                        hintText: 'Correo electrónico',
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Contraseña',
                        obscureText: true,
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () => loginUser(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: GoogleFonts.orbitron(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        child: const Text('Iniciar sesión',
                            style: TextStyle(color: Colors.black)),
                      ),

                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 173, 187, 255),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: GoogleFonts.orbitron(
                            fontSize: 16,
                          ),
                        ),
                        child: const Text('¿No tienes una cuenta?',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
