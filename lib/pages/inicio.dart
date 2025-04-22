import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chronos/pages/retos/reto1.dart';
import 'package:chronos/pages/retos/reto2.dart';
import 'package:chronos/pages/retos/reto3.dart';
import 'package:chronos/components/custom_buttom_bar.dart';

class Iniciopage extends StatelessWidget {
  const Iniciopage({super.key});

  void _irAReto(BuildContext context, int reto) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Atomizando...')),
    );

    Widget page;
    switch (reto) {
      case 1:
        page = const Reto1();
        break;
      case 2:
        page = const Reto2();
        break;
      case 3:
        page = const Reto3();
        break;
      default:
        page = const Reto1();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Posiciones de los círculos
    final p1 = Offset(80, size.height * 0.48);
    final p2 = Offset(size.width - 70, size.height * 0.61);
    final p3 = Offset(90, size.height * 0.75);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            top: -120,
            child: Image.asset(
              'assets/logo1.jpg',
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
          ),

          // CustomPaint para líneas entre círculos
          CustomPaint(
            painter: LinePainter(p1, p2, p3),
            size: Size.infinite,
          ),

          Positioned(
            top: size.height * 0.3,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '¡RETATE!',
                style: GoogleFonts.orbitron(
                  color: Color(0xFF9FC4FF),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.blueAccent,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Botones de retos
          _buildRetoButton(context, p1, 1),
          _buildRetoButton(context, p2, 2),
          _buildRetoButton(context, p3, 3),

          Positioned(
            top: 300,
            left: 30,
            right: 30,
            child: Center(
              child: Text(
                'A medida que avances en conceptos podrás resolver los retos',
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        onHomeTap: () => Navigator.pushReplacementNamed(context, '/inicio'),
        onAtomTap: () => Navigator.of(context, rootNavigator: true).pushNamed('/conceptos'),
        onStarTap: () => Navigator.of(context, rootNavigator: true).pushNamed('/perfil'),
      ),
    );
  }

  Widget _buildRetoButton(BuildContext context, Offset position, int number) {
    return Positioned(
      top: position.dy - 40,
      left: position.dx - 40,
      child: GestureDetector(
        onTap: () => _irAReto(context, number),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF9FC4FF),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.6),
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Center(
            child: Text(
              '$number',
              style: GoogleFonts.orbitron(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Clase que dibuja las líneas entre los puntos
class LinePainter extends CustomPainter {
  final Offset p1, p2, p3;

  LinePainter(this.p1, this.p2, this.p3);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p2, p3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
