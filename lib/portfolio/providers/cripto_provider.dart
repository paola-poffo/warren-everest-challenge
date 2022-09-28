import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/criptos_view_data.dart';
import 'criptos_usecase_provider.dart';


final criptosProvider = FutureProvider<List<CriptosViewData>>(
  (ref) {
    return ref.read(criptosUsecaseProvider).execute();
  },
);
