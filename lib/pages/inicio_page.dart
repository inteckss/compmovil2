import 'package:flutter/material.dart';
import '../widgets/noticia_card.dart';
import '../widgets/seccion_header.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final List<Map<String, String>> noticias = [
    {
      'titulo': 'Inicio del Festival Cultural de Villarrica',
      'descripcion': 'Gran evento cultural con artistas locales y nacionales...',
      'imagen': 'https://www.munivillarrica.cl/wp-content/uploads/2023/09/BANNER-PROVINCIA-scaled.jpg'
    },
    {
      'titulo': 'Nuevos Proyectos Municipales',
      'descripcion': 'La municipalidad anuncia inversiones en infraestructura...',
      'imagen': 'https://www.munivillarrica.cl/wp-content/uploads/2023/09/villa.jpg'
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Buscar noticias...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value.toLowerCase();
              });
            },
          ),
        ),
        
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              // Implementar actualización de noticias
              await Future.delayed(const Duration(seconds: 1));
            },
            child: ListView(
              children: [
                Image.network(
                  'https://www.munivillarrica.cl/wp-content/uploads/2023/09/BANNER-PROVINCIA-scaled.jpg',
                  fit: BoxFit.cover,
                ),
                const SeccionHeader(
                  titulo: 'Últimas Noticias',
                  icono: Icons.newspaper,
                ),
                ...noticias
                    .where((noticia) =>
                        noticia['titulo']!.toLowerCase().contains(searchQuery) ||
                        noticia['descripcion']!.toLowerCase().contains(searchQuery))
                    .map((noticia) => NoticiaCard(
                          titulo: noticia['titulo']!,
                          descripcion: noticia['descripcion']!,
                          imagenUrl: noticia['imagen'],
                          onTap: () {
                            // Implementar navegación detallada
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Abriendo: ${noticia['titulo']}'),
                              ),
                            );
                          },
                        )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}