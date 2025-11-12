import 'package:flutter/material.dart';
import 'package:ini_sportstation/menu.dart';
import 'package:ini_sportstation/app_drawer.dart';

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

  void _saveForm() {
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
              onPressed: () {
                Navigator.of(context).pop(); // Tutup popup
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                  (route) => false,
                ); // Arahkan ke halaman utama
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
                  // Boleh kosong karena opsional
                  if (value == null || value.isEmpty) {
                    return null;
                  }

                  // Cek apakah string bisa diparsing menjadi URL dan memiliki skema http/https
                  final uri = Uri.tryParse(value);
                  if (uri == null ||
                      (!uri.isAbsolute) ||
                      !(uri.scheme == 'http' || uri.scheme == 'https')) {
                    return 'Masukkan URL yang valid (harus diawali dengan http atau https)';
                  }

                  // Valid
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
                onPressed: _saveForm,
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
