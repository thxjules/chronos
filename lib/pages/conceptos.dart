import 'package:chronos/pages/colapso.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chronos/components/custom_buttom_bar.dart';
import 'package:chronos/pages/gatopage.dart';
import 'package:chronos/pages/multiverso.dart';
import 'package:chronos/pages/desencriptacion.dart';

class ConceptosPage extends StatelessWidget {
  const ConceptosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CONCEPTOS CUÁNTICOS',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _conceptCard(
                      context,
                      title: 'Paradoja del Gato',
                      icon: Icons.pets,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Gatopage()),
                      ),
                    ),
                    _conceptCard(
                      context,
                      title: 'Desencripción',
                      icon: Icons.lock_open,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DesencriptacionPage()),
                      ),
                    ),
                    _conceptCard(
                      context,
                      title: 'Colapso de Ondas',
                      icon: Icons.waves,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Colapso()),
                      ),
                    ),
                   
                    _conceptCard(
                      context,
                      title: ' Multiverso',
                      icon: Icons.auto_awesome,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MultiversoPage()),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 164, 162, 250).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.hourglass_bottom,
                        color: Colors.white, size: 40),
                    const SizedBox(height: 10),
                    Text(
                      'Más conceptos pronto',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
       bottomNavigationBar: CustomBottomBar(
        onHomeTap: () => Navigator.pushReplacementNamed(context, '/inicio'),
        onAtomTap: () => Navigator.of(context, rootNavigator: true).pushNamed('/conceptos'),
        onStarTap: () => Navigator.of(context, rootNavigator: true).pushNamed('/perfil'),
    )
    );
  }

  Widget _conceptCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: const Color.fromARGB(255, 173, 173, 246),
            child: Icon(icon, color: Colors.white, size: 36),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
