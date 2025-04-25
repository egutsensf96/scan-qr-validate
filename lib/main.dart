import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scan_qr_validate/routes/router.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
  // Load environment variables
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Scan QR Code',
      routerConfig: AppRouter.router,
    );
  }
}
