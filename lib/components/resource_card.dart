import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResourceCard extends StatelessWidget {
  final String title;
  final String url;

  const ResourceCard({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.link, color: Colors.white),
        title: Text(
          title,
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        trailing: const Icon(Icons.open_in_new, color: Colors.white), // Ícono para abrir el enlace
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No se pudo abrir el enlace')),
            );
          }
        },
      ),
    );
  }
}
