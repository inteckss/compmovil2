import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('No se pudo abrir $urlString');
    }
  }

  Widget _buildNewsCard(String title, String description, String imageAsset, String date) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageAsset,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkButton(String text, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/villarrica_centro.jpg',
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NOTICIAS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildNewsCard(
                  'LA RED DE COMUNIDADES EDUCATIVAS DE LICAN RAY REALIZÓ DESFILE',
                  'Con mucho patriotismo y prestancia juvenil, los estudiantes pertenecientes...',
                  'assets/images/villarrica_centro.jpg',
                  '16 septiembre, 2025',
                ),
                const SizedBox(height: 16),
                _buildNewsCard(
                  'MUNICIPALIDAD DE VILLARRICA Y SENCE CERTIFICAN A GUARDIAS',
                  'En una ceremonia realizada el pasado jueves en el salón auditorio de...',
                  'assets/images/plaza_villarrica.jpg',
                  '16 septiembre, 2025',
                ),
                const SizedBox(height: 24),
                const Text(
                  'ENLACES IMPORTANTES',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildLinkButton(
                  'Concejo Municipal',
                  Icons.people,
                  () => _launchUrl('https://www.munivillarrica.cl/concejo/'),
                ),
                _buildLinkButton(
                  'Cuenta Pública',
                  Icons.description,
                  () => _launchUrl('https://www.munivillarrica.cl/cuenta-publica/'),
                ),
                _buildLinkButton(
                  'Transparencia',
                  Icons.visibility,
                  () => _launchUrl('https://www.munivillarrica.cl/transparencia/'),
                ),
                const SizedBox(height: 24),
                const Text(
                  'ORGANIZACIONES',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildLinkButton(
                  'Junta de Vecinos',
                  Icons.groups,
                  () => _launchUrl('https://www.munivillarrica.cl/junta-de-vecinos/'),
                ),
                _buildLinkButton(
                  'Clubes del Adulto Mayor',
                  Icons.elderly,
                  () => _launchUrl('https://www.munivillarrica.cl/clubes-del-adulto-mayor/'),
                ),
                _buildLinkButton(
                  'Organizaciones Funcionales',
                  Icons.people_outline,
                  () => _launchUrl('https://www.munivillarrica.cl/organizaciones-comunitarias/'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
                  onTap: () => _launchUrl('https://www.munivillarrica.cl/cuenta-publica/'),
                ),
                CategoryItem(
                  title: 'Concejo Municipal',
                  icon: Icons.people,
                  onTap: () => _launchUrl('https://www.munivillarrica.cl/concejo/'),
                ),
                CategoryItem(
                  title: 'Ordenanzas Municipales',
                  icon: Icons.gavel,
                  onTap: () => _launchUrl('https://www.munivillarrica.cl/ordenanzas-municipales/'),
                ),
                CategoryItem(
                  title: 'Informes Financieros',
                  icon: Icons.monetization_on,
                  onTap: () => _launchUrl('https://www.munivillarrica.cl/informes-financieros/'),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}