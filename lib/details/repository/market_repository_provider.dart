import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/api/models/endpoints/cripto_endpoint_provider.dart';
import 'market_repository.dart';

final marketRepositoryProvider = Provider((ref) => MarketRepository(
    ref.watch(criptosEndpointProvider),
  ),
);
