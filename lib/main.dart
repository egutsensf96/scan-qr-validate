import 'package:flutter/material.dart';
import 'package:scan_qr_validate/routes/router.dart';

void main() => runApp(const MyApp());

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
