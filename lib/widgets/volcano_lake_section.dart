import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VolcanoLakeSection extends StatelessWidget {
  const VolcanoLakeSection({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('No se pudo abrir $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Volcán y Lago',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: _buildInfoCard(
                  'Estado del Volcán',
                  'Monitoreo en tiempo real del Volcán Villarrica',
                  Icons.warning,
                  Colors.red,
                  () => _launchUrl('https://rnvv.sernageomin.cl/volcan-villarrica/'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: _buildInfoCard(
                  'Estado del Lago',
                  'Información sobre la calidad del agua y actividades',
                  Icons.water,
                  Colors.blue,
                  () => _launchUrl('https://www.munivillarrica.cl/anteproyecto-plan-de-descontaminacion-para-la-cuenca-del-lago-villarrica/'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Información Importante',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  _buildInfoItem(
                    'Erupciones Volcánicas',
                    'Información histórica y protocolos de emergencia',
                    Icons.history,
                    () => _launchUrl('https://www.munivillarrica.cl/erupciones-volcanicas/'),
                  ),
                  const Divider(),
                  _buildInfoItem(
                    'Cuidados del Lago',
                    'Recomendaciones para preservar el lago',
                    Icons.eco,
                    () => _launchUrl('https://www.munivillarrica.cl/cuidados-del-lago-y-naturaleza/'),
                  ),
                  const Divider(),
                  _buildInfoItem(
                    'Actividades Turísticas',
                    'Guía de actividades permitidas',
                    Icons.directions_boat,
                    () => _launchUrl('http://www.visitvillarrica.cl'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 40.0,
                color: color,
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4.0),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}