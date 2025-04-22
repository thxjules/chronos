import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RetoAvatar extends StatelessWidget {
  final String text;

  const RetoAvatar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Positioned(
              top: -270,
              left: 10,
              right: 10,
              child: CircleAvatar(
                  maxRadius: 300,
                  backgroundColor: const Color(0xFF9FC4FF),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 80.0), // Baja el texto dentro del círculo
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.pressStart2p(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )))
        ]));
  }
}
