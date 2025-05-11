import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/transaction_provider.dart';
import '../widgets/transaction_tile.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionAsync = ref.watch(transactionListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: transactionAsync.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return const Center(child: Text('No transactions found.'));
          }
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tx = transactions[index];
              return TransactionTile(transaction: tx);
            }
              );

        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
