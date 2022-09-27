import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/criptos_view_data.dart';
import 'criptos_repository_provider.dart';
import '../usecase/criptos_usecase.dart';

final criptosUsecaseProvider = Provider((ref) {
    return CriptosUsecase(
      ref.watch(criptosRepositoryProvider),
    );
  },
);

final criptosProvider = FutureProvider<List<CriptosViewData>>((ref) {
    return ref.read(criptosUsecaseProvider).execute();
  },
);