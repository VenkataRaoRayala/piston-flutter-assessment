import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/zephyr_api_service.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final ZephyrApiService apiService;

  TransactionRepositoryImpl(this.apiService);

  @override
  Future<List<Transaction>> getTransactions() async {
    final models = await apiService.fetchTransactions();
    return models.map((model) => model.toEntity()).toList();
  }
}