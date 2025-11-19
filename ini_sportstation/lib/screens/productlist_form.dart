import 'package:flutter/material.dart';
import 'package:ini_sportstation/screens/menu.dart';
import 'package:ini_sportstation/widgets/app_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();

  bool _isFeatured = false;
  String _selectedCategory = 'sepatu';

  final List<Map<String, String>> _categories = [
    {'value': 'sepatu', 'label': 'Sepatu'},
    {'value': 'bola', 'label': 'Bola'},
    {'value': 'baju olahraga', 'label': 'Baju Olahraga'},
    {'value': 'kaos kaki', 'label': 'Kaos Kaki'},
    {'value': 'celana olahraga', 'label': 'Celana Olahraga'},
    {'value': 'raket', 'label': 'Raket'},
  ];

  Future<void> _saveForm(CookieRequest request) async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Data Produk'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Nama: ${_nameController.text}'),
                Text('Harga: ${_priceController.text}'),
                Text('Deskripsi: ${_descriptionController.text}'),
                Text('Thumbnail URL: ${_thumbnailController.text}'),
                Text('Kategori: $_selectedCategory'),
                Text('Featured: ${_isFeatured ? "Ya" : "Tidak"}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final response = await request.postJson(
                  "http://localhost:8000/create-flutter/",
                  jsonEncode({
                    "name": _nameController.text,
                    "price": int.parse(_priceController.text),
                    "description": _descriptionController.text,
                    "thumbnail": _thumbnailController.text.isEmpty
                        ? null
                        : _thumbnailController.text,
                    "category": _selectedCategory,
                    "is_featured": _isFeatured,
                  }),
                );

                if (!context.mounted) return;

                if (response['status'] == 'success') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Product successfully saved!"),
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Something went wrong, please try again."),
                    ),
                  );
                }
              },
              child: const Text('Tutup'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk Baru',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Produk',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama produk tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null || int.parse(value) < 0) {
                    return 'Masukkan harga yang valid (>= 0)';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16.0),

              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16.0),

              TextFormField(
                controller: _thumbnailController,
                decoration: const InputDecoration(
                  labelText: 'URL Thumbnail (opsional)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  }

                  final uri = Uri.tryParse(value);
                  if (uri == null ||
                      !uri.isAbsolute ||
                      !(uri.scheme == 'http' || uri.scheme == 'https')) {
                    return 'Masukkan URL yang valid (http/https)';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16.0),

              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Kategori',
                  border: OutlineInputBorder(),
                ),
                items: _categories
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat['value'],
                        child: Text(cat['label']!),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedCategory = val!;
                  });
                },
              ),

              const SizedBox(height: 16.0),

              CheckboxListTile(
                title: const Text('Featured Product'),
                value: _isFeatured,
                onChanged: (val) {
                  setState(() {
                    _isFeatured = val!;
                  });
                },
              ),

              const SizedBox(height: 20.0),

              ElevatedButton(
                onPressed: () => _saveForm(request),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
