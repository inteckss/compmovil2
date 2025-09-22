import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.account_balance, size: 40, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'Municipalidad de Villarrica',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Inicio',
              style: TextStyle(fontFamily: 'Montserrat'),
            ),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text(
              'Noticias',
              style: TextStyle(fontFamily: 'Montserrat'),
            ),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text(
              'Historia',
              style: TextStyle(fontFamily: 'Montserrat'),
            ),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text(
              'Trámites',
              style: TextStyle(fontFamily: 'Montserrat'),
            ),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
        ],
      ),
    );
  }
}