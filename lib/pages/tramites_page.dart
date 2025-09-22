import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/tramite_tile.dart';

class TramitesPage extends StatefulWidget {
  const TramitesPage({super.key});

  @override
  State<TramitesPage> createState() => _TramitesPageState();
}

class _TramitesPageState extends State<TramitesPage> {
  final List<Map<String, String>> _tramites = [
    {"id": "1", "title": "Certificado de Residencia", "description": "Obtén un certificado que acredita tu domicilio."},
    {"id": "2", "title": "Patente Comercial", "description": "Solicitud o renovación de patente comercial municipal."},
    {"id": "3", "title": "Permiso de Circulación", "description": "Paga tu permiso anual para vehículos motorizados."},
    {"id": "4", "title": "Subsidio Habitacional", "description": "Postulación al beneficio para la vivienda."},
    {"id": "5", "title": "Licencia de Conducir", "description": "Obtén o renueva tu licencia de conducir."},
  ];

  List<String> _favoritos = [];
  String _busqueda = "";

  @override
  void initState() {
    super.initState();
    _cargarFavoritos();
  }

  // FUNCIONALIDAD EXTRA: Favoritos (persistencia con shared_preferences)
  // Justificación (rúbrica): Permite que el usuario marque trámites frecuentes y los recupere en futuras sesiones.
  // Pertinencia: demuestra manejo de persistencia local y mejora la experiencia de uso.
  // Archivo: lib/pages/tramites_page.dart
  Future<void> _cargarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoritos = prefs.getStringList('favoritos') ?? [];
    });
  }

  Future<void> _guardarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoritos', _favoritos);
  }

  void _toggleFavorito(String id) {
    setState(() {
      if (_favoritos.contains(id)) {
        _favoritos.remove(id);
      } else {
        _favoritos.add(id);
      }
    });
    _guardarFavoritos();
  }

  @override
  Widget build(BuildContext context) {
    // Filtrar trámites por búsqueda
    final tramitesFiltrados = _tramites.where((t) {
      final query = _busqueda.toLowerCase();
      return t["title"]!.toLowerCase().contains(query) ||
          t["description"]!.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trámites Municipales"),
      ),
      body: Column(
        children: [
          // FUNCIONALIDAD EXTRA: Buscador de trámites
          // Justificación (rúbrica): Facilita al usuario encontrar trámites específicos sin revisar listas largas.
          // Pertinencia: mejora la eficiencia del usuario y la experiencia de búsqueda.
          // Archivo: lib/pages/tramites_page.dart
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Buscar trámite...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                setState(() {
                  _busqueda = valor;
                });
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tramitesFiltrados.length,
              itemBuilder: (context, index) {
                final tramite = tramitesFiltrados[index];
                final id = tramite["id"]!;
                return TramiteTile(
                  id: id,
                  title: tramite["title"]!,
                  description: tramite["description"]!,
                  isFavorite: _favoritos.contains(id),
                  onFavoriteToggle: () => _toggleFavorito(id),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Abrir detalle de: ${tramite["title"]}")),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
