import 'package:flutter/material.dart';

class MunicipalityPage extends StatelessWidget {
  const MunicipalityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Municipalidad'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Card(
            child: ListTile(
              title: Text('Alcalde'),
              subtitle: Text('Pablo Astete Mermoud'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Dirección'),
              subtitle: Text('Pedro de Valdivia 810'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Horario de Atención'),
              subtitle: Text('Lunes a viernes de 9:00 a 13:00 Hrs'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Teléfono'),
              subtitle: Text('(45) 2206500'),
            ),
          ),
        ],
      ),
    );
  }
}