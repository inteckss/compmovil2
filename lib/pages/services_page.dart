import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Pagos Municipales',
        'icon': Icons.payment,
        'description': 'Realiza pagos de servicios municipales',
      },
      {
        'title': 'Trámites en Línea',
        'icon': Icons.computer,
        'description': 'Gestiona tus trámites de manera digital',
      },
      {
        'title': 'Oficina Virtual',
        'icon': Icons.desktop_windows,
        'description': 'Accede a servicios municipales en línea',
      },
      {
        'title': 'Consultas',
        'icon': Icons.help_outline,
        'description': 'Resuelve tus dudas sobre servicios municipales',
      },
      {
        'title': 'Denuncias',
        'icon': Icons.report_problem,
        'description': 'Realiza denuncias o reclamos',
      },
      {
        'title': 'Agenda de Atención',
        'icon': Icons.calendar_today,
        'description': 'Agenda tu hora para atención presencial',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Card(
            elevation: 2,
            child: InkWell(
              onTap: () {
                // TODO: Navegar al servicio seleccionado
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      service['icon'] as IconData,
                      size: 48,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      service['title'] as String,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      service['description'] as String,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}