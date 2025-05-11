import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'feature/transactions/presentation/pages/transactions_page.dart';

void main() {
  runApp(ProviderScope(child: const ZephyrPayApp()));
}

class ZephyrPayApp extends StatelessWidget {
  const ZephyrPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ZephyrPay',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TransactionsPage()
    );
  }
}