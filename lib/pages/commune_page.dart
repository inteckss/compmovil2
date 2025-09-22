import 'package:flutter/material.dart';

class CommunePage extends StatelessWidget {
  const CommunePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comuna'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Card(
            child: ListTile(
              title: Text('Historia'),
              subtitle: Text('Historia de Villarrica'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Límites Comunales'),
              subtitle: Text('Información geográfica'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Información Sociodemográfica'),
              subtitle: Text('Datos de la población'),
            ),
          ),
        ],
      ),
    );
  }
}