import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/optimized_image.dart';

class TourismPage extends StatefulWidget {
  const TourismPage({super.key});

  @override
  State<TourismPage> createState() => _TourismPageState();
}

class _TourismPageState extends State<TourismPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Turismo en Villarrica',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  OptimizedImage(
                    imageUrl: 'https://villarrica.org/wp-content/uploads/2023/06/VolcanVillarrica-e1686583232489.jpg',
                    fit: BoxFit.cover,
                  ),
                  // Gradiente para mejorar la legibilidad del título
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Descubre Villarrica',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Villarrica es una ciudad turística ubicada en la Región de la Araucanía, Chile. '
                      'Famosa por su volcán activo, lago y actividades al aire libre.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Principales Atracciones',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildAttractionCard(
                      context,
                      'Volcán Villarrica',
                      'Uno de los volcanes más activos de Chile, ofrece vistas espectaculares y actividades de montaña durante todo el año.',
                      'https://www.latercera.com/resizer/ZBi6HzOh7EctJo3E0G_iC0qA6PI=/arc-anglerfish-arc2-prod-copesa/public/4C2EJHZ265HKPPQC2USQXJ73VA.jpg',
                    ),
                    _buildAttractionCard(
                      context,
                      'Lago Villarrica',
                      'Un paraíso para los amantes de los deportes acuáticos, con playas perfectas para el descanso y la recreación.',
                      'https://www.chiletourism.com/wp-content/uploads/2023/01/lago-villarrica.jpg',
                    ),
                    _buildAttractionCard(
                      context,
                      'Centro Histórico',
                      'Descubre la rica historia y cultura local en el corazón de nuestra ciudad.',
                      'https://media-cdn.tripadvisor.com/media/photo-s/16/ca/78/db/plaza-de-armas.jpg',
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Actividades Destacadas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildActivityCard(
                      context,
                      'Ascenso al Volcán',
                      'Excursiones guiadas al volcán con todo el equipamiento necesario',
                      'https://www.geovirtual2.cl/Turismo/ima/Villarrica-volcan-02.jpg',
                    ),
                    _buildActivityCard(
                      context,
                      'Deportes Acuáticos',
                      'Kayak, paddle, navegación y más actividades en el lago',
                      'https://araucanialacustre.cl/wp-content/uploads/2021/12/kayak.jpg',
                    ),
                    _buildActivityCard(
                      context,
                      'Termas',
                      'Relájate en nuestras aguas termales naturales',
                      'https://web.villarricahot.cl/img/termas-geometricas.jpg',
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: 'reservar',
            onPressed: () {
              // TODO: Implementar acción de reserva
            },
            label: const Text('Reservar Tour'),
            icon: const Icon(Icons.bookmark),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'subir',
            onPressed: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }

  Widget _buildAttractionCard(
    BuildContext context,
    String title,
    String description,
    String imageUrl,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // TODO: Navegar a detalles de la atracción
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OptimizedImage(
              imageUrl: imageUrl,
              height: 180,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(
    BuildContext context,
    String title,
    String description,
    String imageUrl,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // TODO: Navegar a detalles de la actividad
        },
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: OptimizedImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}