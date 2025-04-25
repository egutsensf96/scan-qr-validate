import 'dart:convert'; // Import necesario para decodificar JSON
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../services/api.dart';
import '../models/person.dart'; // Importar el modelo Person

class Qr extends StatefulWidget {
  const Qr({super.key});

  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
  Person? scannedPerson;
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
        scannedPerson = Person.fromJson(jsonResponse);
      });
    } catch (e) {
      setState(() {
        scannedPerson = null;
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
      appBar: AppBar(
        title: const Text('Escanear QR'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.go('/text-ci');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              for (final barcode in capture.barcodes) {
                if (barcode.rawValue != null) {
                  final String code = barcode.rawValue!;
                  _fetchStudentData(code);
                  break; // Stop after the first valid barcode
                }
              }
            },
          ),
          if (scannedPerson != null)
            Center(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Nombre: ${scannedPerson!.personalData.name} ${scannedPerson!.personalData.lastName}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Identificación: ${scannedPerson!.personalData.identification}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Facultad: ${scannedPerson!.docentData.faculty}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Carrera: ${scannedPerson!.docentData.career}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Año: ${scannedPerson!.docentData.year}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            scannedPerson = null;
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
