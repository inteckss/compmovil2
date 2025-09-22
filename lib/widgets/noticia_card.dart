import 'package:flutter/material.dart';

/// Widget reutilizable para mostrar noticias en formato de tarjeta
/// Se utiliza en la página de inicio y otras secciones que muestren noticias
class NoticiaCard extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String? imagenUrl;
  final VoidCallback? onTap;

  const NoticiaCard({
    super.key,
    required this.titulo,
    required this.descripcion,
    this.imagenUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagenUrl != null)
              Image.network(
                imagenUrl!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    descripcion,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}