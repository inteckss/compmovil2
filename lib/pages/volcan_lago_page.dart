import 'package:flutter/material.dart';

class VolcanLagoPage extends StatelessWidget {
  const VolcanLagoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            'https://www.munivillarrica.cl/wp-content/uploads/2023/09/volcan.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Volcán Villarrica',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'El Volcán Villarrica es uno de los volcanes más activos de Chile...',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Lago Villarrica',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Image.network(
                  'https://www.munivillarrica.cl/wp-content/uploads/2023/09/lago.jpg',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                const Text(
                  'El Lago Villarrica es uno de los principales atractivos turísticos...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}