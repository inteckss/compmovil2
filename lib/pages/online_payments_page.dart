import 'package:flutter/material.dart';

class OnlinePaymentsPage extends StatelessWidget {
  const OnlinePaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagos Online'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.payment),
              title: Text('Permisos de Circulación'),
              subtitle: Text('Pague su permiso de circulación online'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.gavel),
              title: Text('Multas'),
              subtitle: Text('Pague sus multas del Juzgado de Policía Local'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.business),
              title: Text('Patentes Comerciales'),
              subtitle: Text('Pague su patente comercial'),
            ),
          ),
        ],
      ),
    );
  }
}