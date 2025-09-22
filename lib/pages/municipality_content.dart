import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MunicipalityContent extends StatelessWidget {
  const MunicipalityContent({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('No se pudo abrir $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enlaces Municipales',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildLinkButton(
            'Alcaldía',
            () => _launchUrl('https://www.munivillarrica.cl/alcaldia/'),
          ),
          _buildLinkButton(
            'Direcciones Municipales',
            () => _launchUrl('https://www.munivillarrica.cl/direcciones/'),
          ),
          _buildLinkButton(
            'Concejo Municipal',
            () => _launchUrl('https://www.munivillarrica.cl/concejo/'),
          ),
          _buildLinkButton(
            'Organizaciones Comunitarias',
            () => _launchUrl('https://www.munivillarrica.cl/organizaciones-comunitarias/'),
          ),
          _buildLinkButton(
            'Transparencia',
            () => _launchUrl('https://www.munivillarrica.cl/transparencia/'),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkButton(String text, VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.centerLeft,
        ),
        child: Text(text),
      ),
    );
  }
}