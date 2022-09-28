import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'criptos_repository_provider.dart';
import '../usecase/criptos_usecase.dart';

final criptosUsecaseProvider = Provider((ref) {
    return CriptosUsecase(
      ref.watch(criptosRepositoryProvider),
    );
  },
);

