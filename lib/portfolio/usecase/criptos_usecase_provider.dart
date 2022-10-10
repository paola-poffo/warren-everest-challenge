import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/criptos_repository_provider.dart';
import 'criptos_usecase.dart';

final criptosUsecaseProvider = Provider((ref) {
    return CriptosUsecase(
      ref.watch(criptosRepositoryProvider),
    );
  },
);

