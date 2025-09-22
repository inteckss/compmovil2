import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('No se pudo abrir el enlace: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'NUESTRAS REDES SOCIALES',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialMediaButton(
                icon: FontAwesomeIcons.facebook,
                color: Colors.blue[900]!,
                onPressed: () => _launchUrl('https://www.facebook.com/munivillarricaoficial'),
              ),
              SocialMediaButton(
                icon: FontAwesomeIcons.instagram,
                color: Colors.pink,
                onPressed: () => _launchUrl('https://www.instagram.com/villarricamuni/'),
              ),
              SocialMediaButton(
                icon: FontAwesomeIcons.twitter,
                color: Colors.blue,
                onPressed: () => _launchUrl('https://twitter.com/villarricamuni'),
              ),
              SocialMediaButton(
                icon: FontAwesomeIcons.youtube,
                color: Colors.red,
                onPressed: () => _launchUrl('https://www.youtube.com/channel/UChSaocVcb65jbmg1Y2ongaw'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: FaIcon(
            icon,
            size: 24.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}