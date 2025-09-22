import 'package:flutter/material.dart';
import 'widgets/link_section.dart';


import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContent();
  }
}

class MunicipalityPage extends StatelessWidget {
  const MunicipalityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Enlaces Municipales',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
          ),
          LinkSection(
            title: 'Servicios',
            links: [
              const LinkItem(
                title: 'Permisos de Circulación',
                url: 'https://www.munivillarrica.cl/permisos-circulacion',
                icon: Icons.directions_car,
              ),
              const LinkItem(
                title: 'Patentes Municipales',
                url: 'https://www.munivillarrica.cl/patentes-municipales',
                icon: Icons.business,
              ),
              const LinkItem(
                title: 'Licencias de Conducir',
                url: 'https://www.munivillarrica.cl/licencias-conducir',
                icon: Icons.card_membership,
              ),
            ],
          ),
          LinkSection(
            title: 'Documentos',
            links: [
              const LinkItem(
                title: 'Transparencia',
                url: 'https://www.munivillarrica.cl/transparencia',
                icon: Icons.description,
              ),
              const LinkItem(
                title: 'Ordenanzas Municipales',
                url: 'https://www.munivillarrica.cl/ordenanzas',
                icon: Icons.gavel,
              ),
              const LinkItem(
                title: 'Concejo Municipal',
                url: 'https://www.munivillarrica.cl/concejo',
                icon: Icons.people,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommunePage extends StatelessWidget {
  const CommunePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/plaza_villarrica.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nuestra Comuna',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Villarrica es una comuna ubicada en la Región de La Araucanía, Chile. '
                  'Es conocida por su hermoso lago, el imponente volcán y su rica cultura mapuche.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Datos de la Comuna',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildInfoCard(
                  'Población',
                  '59.103 habitantes (Censo 2017)',
                  Icons.people,
                ),
                _buildInfoCard(
                  'Superficie',
                  '1.291,1 km²',
                  Icons.map,
                ),
                _buildInfoCard(
                  'Altitud',
                  '227 m s.n.m.',
                  Icons.height,
                ),
                _buildInfoCard(
                  'Clima',
                  'Templado lluvioso',
                  Icons.wb_sunny,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[700]),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(content),
      ),
    );
  }
}

class OnlinePaymentsPage extends StatelessWidget {
  const OnlinePaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Pagos Online',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
          ),
          LinkSection(
            title: 'Servicios en Línea',
            links: [
              const LinkItem(
                title: 'Municipios Digitales (Pagos Online)',
                url: 'https://www.munivillarrica.cl/municipios-digitales/',
                icon: Icons.language,
              ),
              const LinkItem(
                title: 'Pago de Multas y Partes',
                url: 'https://www.munivillarrica.cl/pago-de-multas/',
                icon: Icons.gavel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TourismPage extends StatelessWidget {
  const TourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/lago_villarrica.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Turismo en Villarrica',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Descubre los atractivos turísticos de Villarrica, su lago, volcán, cultura y mucho más.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                LinkSection(
                  title: 'Sitio Oficial de Turismo',
                  links: [
                    LinkItem(
                      title: 'Visita Villarrica',
                      url: 'http://www.visitvillarrica.cl/',
                      icon: Icons.travel_explore,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}