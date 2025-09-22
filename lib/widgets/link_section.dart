import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkItem {
  final String title;
  final String url;
  final IconData icon;

  const LinkItem({
    required this.title,
    required this.url,
    required this.icon,
  });
}

class LinkSection extends StatelessWidget {
  final String title;
  final List<LinkItem> links;

  const LinkSection({
    super.key,
    required this.title,
    required this.links,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: links.length,
            itemBuilder: (context, index) {
              final link = links[index];
              return Card(
                child: ListTile(
                  leading: Icon(link.icon, color: Colors.blue[700]),
                  title: Text(link.title),
                  onTap: () async {
                    final uri = Uri.parse(link.url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}