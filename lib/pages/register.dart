import 'package:flutter/material.dart';
import 'package:chronos/database_helper.dart'; 
import 'package:chronos/components/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chronos/pages/login.dart';  

class Register extends StatelessWidget {
  Register({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUser(BuildContext context) async {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Completa los datos')),
      );
      return;
    }

    try {
      // Verifica si ya existe un usuario con el mismo correo
      final existingUser = await DatabaseHelper.instance.getUserByEmail(email);

      if (existingUser != null) {
        // Si el usuario ya existe
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ya existe una cuenta con ese correo')),
        );
      } else {
        final user = await DatabaseHelper.instance.addUser(username, email, password);

        if (user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('¡Cuenta creada exitosamente!')),
          );
          Navigator.pop(context); // Regresa a la pantalla anterior
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al registrar la cuenta')),
          );
        }
      }
    } catch (e) {
      // Manejo de errores
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar: $e')),
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

          // Contenido encima de la imagen
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: DefaultTextStyle(
                  style: GoogleFonts.exo2(color: Colors.white),
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
                        '¡Siente las ondas impactar en tu cerebro!',
                        style: GoogleFonts.orbitron(
                          color: Color(0xFFC6AFEF),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 25),

                      MyTextField(
                        controller: usernameController,
                        hintText: 'Nombre de usuario',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

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
                        onPressed: () => registerUser(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: GoogleFonts.orbitron(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        child: const Text('Registrarse', style: TextStyle(color: Colors.black)),
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          // Redirigir a la página de login
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 173, 187, 255),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: GoogleFonts.orbitron(
                            fontSize: 16,
                          ),
                        ),
                        child: const Text('¿Ya tienes una cuenta?', style: TextStyle(color: Colors.black)),
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
