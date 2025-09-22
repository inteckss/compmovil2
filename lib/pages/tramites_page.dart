import 'package:flutter/material.dart';

class TramitesPage extends StatelessWidget {
  const TramitesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tramites = [
      {'titulo': 'Permisos de Circulación', 'icono': Icons.directions_car},
      {'titulo': 'Licencias de Conducir', 'icono': Icons.card_membership},
      {'titulo': 'Patentes Comerciales', 'icono': Icons.store},
      {'titulo': 'Certificados', 'icono': Icons.description},
      {'titulo': 'Obras Municipales', 'icono': Icons.business},
    ];

    return ListView.builder(
      itemCount: tramites.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListTile(
            leading: Icon(tramites[index]['icono'] as IconData),
            title: Text(tramites[index]['titulo'] as String),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Implementar navegación al trámite
            },
          ),
        );
      },
    );
  }
}