import 'package:flutter/material.dart';

import '../../domain/entities/transaction.dart';
import '../pages/transaction_details_page.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  const TransactionTile({super.key,required this.transaction});

  @override
  Widget build(BuildContext context) {
    // used repaint boundary for performance
    return RepaintBoundary(
      child: ListTile(
        key: ValueKey(transaction.id),
        title: Text(
          transaction.description!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '₹${transaction.amount!.toStringAsFixed(2)}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionDetailPage(transaction: transaction),
            ),
          );
        },
      ),
    );
  }
}
