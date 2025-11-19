import 'package:flutter/material.dart';
import 'package:ini_sportstation/screens/login.dart';
import 'package:ini_sportstation/screens/productlist_form.dart';
import 'package:ini_sportstation/widgets/app_drawer.dart';
import 'package:ini_sportstation/screens/product_entry_list.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Faris Huda";
  final String npm = "2406421970";
  final String kelas = "E";

  final List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.shopping_cart),
    ItemHomepage("My Products", Icons.store),
    ItemHomepage("Create Product", Icons.add),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ini Sportstation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      drawer: const AppDrawer(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                bool isSmallScreen = constraints.maxWidth < 600;

                // Responsif untuk InfoCard
                if (isSmallScreen) {
                  // Jika layar kecil, InfoCard tampil vertikal
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InfoCard(title: 'NPM', content: npm),
                      InfoCard(title: 'Nama', content: nama),
                      InfoCard(title: 'Kelas', content: kelas),
                    ],
                  );
                } else {
                  // Jika layar lebar, InfoCard tampil horizontal
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoCard(title: 'NPM', content: npm),
                      InfoCard(title: 'Nama', content: nama),
                      InfoCard(title: 'Kelas', content: kelas),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.only(top: 16.0, left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Selamat datang di Ini Sportstation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () async {
                      final request = context.read<CookieRequest>();
                      final response = await request.logout(
                        "http://localhost:8000/auth/logout/",
                      );

                      String message = response["message"];
                      if (context.mounted) {
                        if (response['status']) {
                          String uname = response["username"];
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("$message See you again, $uname."),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(message)));
                        }
                      }
                    },
                    child: Text("Logout"),
                  ),
                ],
              ),
            ),

            // GridView responsif
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth < 600 ? 1 : 3;

                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.all(20),
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // nonaktifkan scroll internal
                  children: items.map((item) => ItemCard(item)).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    switch (item.name) {
      case "All Products":
        backgroundColor = Colors.blue;
        break;
      case "My Products":
        backgroundColor = Colors.green;
        break;
      case "Create Product":
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Theme.of(context).colorScheme.secondary;
    }

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          if (item.name == "Create Product") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateProductPage(),
              ),
            );
          } else if (item.name == "All Products") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryListPage(),
              ),
            );
          } else if (item.name == "My Products") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryListPage(filter: "my"),
              ),
            );
          } else {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}"),
                ),
              );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  ItemHomepage(this.name, this.icon);
}
