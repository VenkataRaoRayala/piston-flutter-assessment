import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../models/transaction_model.dart';

class ZephyrApiService {
  // Simulate fetching data from an API
  Future<List<TransactionModel>> fetchTransactions() async {
    await Future.delayed(Duration(seconds: 1));
    // used compute to reduce the load
    return compute(_generateTransactions, 50);
  }
}
// mock method to generate list of n transactions
List<TransactionModel> _generateTransactions(int count) {
  return List.generate(count, (index) {
    return TransactionModel(
      id: '$index',
      description: 'Transaction $index',
      amount: (index + 1) * 10.0,
      date: DateTime.now().subtract(Duration(days: index)),
    );
  });
}
