import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/transactions_model.dart';

final transactionsProvider = StateProvider<List<TransactionsModel>>((ref) {
    return [];
  },
);
