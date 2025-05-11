import '../../domain/entities/transaction.dart';

class TransactionModel {
  final String? id;
  final double? amount;
  final DateTime? date;
  final String? description;

  TransactionModel({
    this.id,
    this.amount,
    this.date,
    this.description,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'date': date?.toIso8601String(),
      'description': description,
    };
  }

  Transaction toEntity() {
    return Transaction(
      id: id ?? '',
      amount: amount ?? 0.0,
      date: date ?? DateTime.now(),
      description: description ?? '',
    );
  }

  static TransactionModel fromEntity(Transaction entity) {
    return TransactionModel(
      id: entity.id,
      amount: entity.amount,
      date: entity.date,
      description: entity.description,
    );
  }
}

