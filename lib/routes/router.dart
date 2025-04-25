import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scan_qr_validate/pages/qr.dart';
import 'package:scan_qr_validate/pages/text_search.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/qr',
    routes: [
      GoRoute(path: '/qr', name: 'qr', builder: (context, state) => Qr()),
      GoRoute(
        path: '/text-ci',
        name: 'TextCi',
        builder: (context, state) => TextSearch(),
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('Error: ${state.error}')),
      );
    },
  );
}
