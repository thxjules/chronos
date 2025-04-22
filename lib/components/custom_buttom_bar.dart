import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAtomTap;
  final VoidCallback? onStarTap;

  const CustomBottomBar({
    Key? key,
    this.onHomeTap,
    this.onAtomTap,
    this.onStarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(color: const Color.fromARGB(255, 165, 178, 243)),
          ),

          // Botón Home
          Positioned(
            left: 18,
            bottom: 15,
            child: IconButton(
              icon: const Icon(Icons.home, size: 80, color: Colors.black),
              onPressed: onHomeTap, 
            ),
          ),

          // Icono átomo al centro
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 48,
            bottom: 15,
            child: IconButton(
              icon: const Icon(Icons.science, size: 80, color: Colors.black),
              onPressed: onAtomTap,
            ),
          ),

          // Botón estrella
          Positioned(
            right: 18,
            bottom: 15,
            child: IconButton(
              icon: const Icon(Icons.star, size: 80, color: Colors.black),
              onPressed: onStarTap, 
            ),
          )
        ],
      ),
    );
  }
}
