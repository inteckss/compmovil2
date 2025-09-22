import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/pages.dart';
import 'package:flutter_application_1/widgets/image_carousel.dart';
import 'package:flutter_application_1/widgets/news_carousel.dart';
import 'package:flutter_application_1/widgets/social_media_bar.dart';
import 'package:flutter_application_1/widgets/quick_access_section.dart';
import 'package:flutter_application_1/widgets/volcano_lake_section.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Municipalidad de Villarrica',
      theme: AppTheme.theme,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    MunicipalityPage(),
    CommunePage(),
    OnlinePaymentsPage(),
    TourismPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Municipalidad de Villarrica',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      // drawer: const CustomDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIndex: _currentIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.business),
            label: 'Municipalidad',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_city),
            label: 'Comuna',
          ),
          NavigationDestination(
            icon: Icon(Icons.payment),
            label: 'Pagos Online',
          ),
          NavigationDestination(
            icon: Icon(Icons.tour),
            label: 'Turismo',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  HomeContent({super.key});

  final List<String> carouselImages = [
    'assets/images/villarrica_centro.jpg',
    'assets/images/Volcan_Villarrica.webp',
    'assets/images/lago_villarrica.jpg',
    'assets/images/plaza_villarrica.jpg',
  ];

  final List<NewsItem> newsItems = [
    const NewsItem(
      title: 'LA RED DE COMUNIDADES EDUCATIVAS DE LICAN RAY REALIZÓ DESFILE DE FIESTAS PATRIAS',
      description: 'Con mucho patriotismo y prestancia juvenil, los estudiantes pertenecientes a los establecimientos de la Red de Comunidades Educativas de Lican Ray...',
      imageUrl: 'assets/images/villarrica_centro.jpg',
      date: '16 septiembre, 2025',
    ),
    const NewsItem(
      title: 'MUNICIPALIDAD DE VILLARRICA Y SENCE CERTIFICAN A NUEVOS GUARDIAS DE SEGURIDAD',
      description: 'En una ceremonia realizada el pasado jueves en el salón auditorio de la Municipalidad de Villarrica, se llevó a cabo la certificación del curso Servicio...',
      imageUrl: 'assets/images/plaza_villarrica.jpg',
      date: '16 septiembre, 2025',
    ),
    const NewsItem(
      title: 'ALCALDE PABLO ASTETE RETOMA PROYECTO SITIO HISTÓRICO',
      description: 'En su reciente visita a Santiago, el alcalde de Villarrica, Pablo Astete, se reunió con el encargado nacional del Fondo de Infraestructuras Culturales...',
      imageUrl: 'assets/images/lago_villarrica.jpg',
      date: '12 septiembre, 2025',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Implementar actualización de noticias
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageCarousel(imageUrls: carouselImages),
            const SocialMediaBar(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Noticias Destacadas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NewsCarousel(news: newsItems),
            const SizedBox(height: 24.0),
            const QuickAccessSection(),
            const SizedBox(height: 24.0),
            const VolcanoLakeSection(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}