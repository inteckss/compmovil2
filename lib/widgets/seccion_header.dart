import 'package:flutter/material.dart';

/// Widget reutilizable para encabezados de sección
/// Mantiene consistencia visual en todas las páginas
class SeccionHeader extends StatelessWidget {
  final String titulo;
  final IconData? icono;

  const SeccionHeader({
    super.key,
    required this.titulo,
    this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (icono != null) ...[
            Icon(icono, size: 28, color: Colors.blue),
            const SizedBox(width: 8),
          ],
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}