import 'package:flutter/material.dart';

class QuickAccessSection extends StatelessWidget {
  const QuickAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trámites y Servicios Frecuentes',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: const [
              QuickAccessCard(
                icon: Icons.directions_car,
                title: 'Permisos de Circulación',
                color: Colors.blue,
              ),
              QuickAccessCard(
                icon: Icons.gavel,
                title: 'Pago de Multas',
                color: Colors.red,
              ),
              QuickAccessCard(
                icon: Icons.card_membership,
                title: 'Licencias de Conducir',
                color: Colors.green,
              ),
              QuickAccessCard(
                icon: Icons.business,
                title: 'Patentes Comerciales',
                color: Colors.orange,
              ),
              QuickAccessCard(
                icon: Icons.description,
                title: 'Certificados',
                color: Colors.purple,
              ),
              QuickAccessCard(
                icon: Icons.home_work,
                title: 'Obras Municipales',
                color: Colors.teal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const QuickAccessCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          // Implementar navegación al trámite correspondiente
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color,
                color.withOpacity(0.8),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40.0,
                color: Colors.white,
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}