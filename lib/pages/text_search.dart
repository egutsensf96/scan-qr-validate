import 'dart:convert'; // Import necesario para decodificar JSON
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import '../services/api.dart';
import '../models/person.dart'; // Importar el modelo Person

class TextSearch extends StatefulWidget {
  const TextSearch({super.key});

  @override
  State<TextSearch> createState() => _TextSearchState();
}

class _TextSearchState extends State<TextSearch> {
  final TextEditingController _ciController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Person? fetchedPerson;
  bool isLoading = false;

  void _fetchStudentData(String ci) async {
    setState(() {
      isLoading = true;
    });

    try {
      final apiService = ApiService(
        username: dotenv.env['USERNAME'] ?? '',
        password: dotenv.env['PASSWORD'] ?? '',
      );
      final response = await apiService.getStudentData(ci);
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        fetchedPerson = Person.fromJson(jsonResponse);
      });
    } catch (e) {
      setState(() {
        fetchedPerson = null;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Búsqueda por CI')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _ciController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Ingrese el CI',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El CI es obligatorio';
                      }
                      if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                        return 'El CI debe tener exactamente 11 dígitos';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _fetchStudentData(_ciController.text);
                      }
                    },
                    child: const Text('Consultar'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/qr'); // Regresa a la página anterior (QR)
                    },
                    child: const Text('Volver a Escanear QR'),
                  ),
                ],
              ),
            ),
          ),
          if (fetchedPerson != null)
            Center(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Nombre: ${fetchedPerson!.personalData.name} ${fetchedPerson!.personalData.lastName}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Identificación: ${fetchedPerson!.personalData.identification}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Facultad: ${fetchedPerson!.docentData.faculty}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Carrera: ${fetchedPerson!.docentData.career}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Año: ${fetchedPerson!.docentData.year}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            fetchedPerson = null;
                          });
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
