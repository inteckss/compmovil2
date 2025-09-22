import 'package:flutter/material.dart';

class HistoriaPage extends StatelessWidget {
  const HistoriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Historia de Villarrica',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Image.network(
            'https://www.munivillarrica.cl/wp-content/uploads/2023/09/villa.jpg',
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            'La ciudad de Villarrica fue fundada el 1 de enero de 1552...',
            style: TextStyle(fontSize: 16),
          ),
          // Aquí puedes agregar más contenido histórico
        ],
      ),
    );
  }
}