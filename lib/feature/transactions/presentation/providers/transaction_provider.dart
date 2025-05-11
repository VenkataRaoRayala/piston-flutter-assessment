import 'package:riverpod/riverpod.dart';
import '../../data/datasources/zephyr_api_service.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/usecases/get_transactions_usecase.dart';

final apiServiceProvider = Provider((ref) => ZephyrApiService());

final transactionRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider);
  return TransactionRepositoryImpl(api);
});
final getTransactionsUseCaseProvider = Provider.autoDispose((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return GetTransactionsUseCase(repository);
});

class TransactionListNotifier extends AsyncNotifier<List<Transaction>> {
  @override
  Future<List<Transaction>> build() async {
    final useCase = ref.watch(getTransactionsUseCaseProvider);
    return await useCase();
  }
}

final transactionListProvider =
AsyncNotifierProvider<TransactionListNotifier, List<Transaction>>(() => TransactionListNotifier());
