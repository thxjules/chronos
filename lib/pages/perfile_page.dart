import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'session.dart';
import 'package:chronos/components/custom_buttom_bar.dart';
import 'package:chronos/pages/login.dart';
import 'package:chronos/components/resource_card.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final displayName = Session.username;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Encabezado con imagen y fondo lila
          Container(
            height: 280,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFAFA5FF),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(100),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 60),
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/perfil.png'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Text(
            '$displayName!',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // Sección de estadísticas
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // Desafíos completados
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 178, 203),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Proximamente...  '
                          ''
                          'Desafios completados',
                          style: GoogleFonts.orbitron(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Logros
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB6D9FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Proximamente...  '
                          ''
                          'Logros',
                          style: GoogleFonts.orbitron(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            // Íconos vacíos o decorativos
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Recursos recomendados
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recursos Cuánticos',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                ResourceCard(
                  title: '¿Qué es la Física Cuántica?',
                  url: 'https://youtu.be/uHrCIWsxMt0?si=nWYdTp3KkqlrXD2S',
                ),
                ResourceCard(
                  title: 'El Universo en 10 minutos',
                  url: 'https://www.youtube.com/watch?v=ELel0P7ZDlQ',
                ),
              ],
            ),
          ),

          // Botón Cerrar Sesión
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () {
                // Redirigir a la página de login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 173, 187, 255),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: GoogleFonts.orbitron(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              child: const Text('Cerrar Sesión',
                  style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        onHomeTap: () => Navigator.pushReplacementNamed(context, '/inicio'),
        onAtomTap: () =>
            Navigator.of(context, rootNavigator: true).pushNamed('/conceptos'),
        onStarTap: () =>
            Navigator.of(context, rootNavigator: true).pushNamed('/perfil'),
      ), // Se asume que este componente ya lo tienes creado
    );
  }
}
