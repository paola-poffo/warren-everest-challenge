import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/api/models/endpoints/cripto_endpoint_provider.dart';
import '../repository/criptos_repository.dart';

final criptosRepositoryProvider = Provider((ref) {
    return CriptosRepository(
      ref.watch(criptosEndpointProvider),
    );
  },
);