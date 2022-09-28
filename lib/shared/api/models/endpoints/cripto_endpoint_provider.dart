import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'criptos_endpoint.dart';

final criptosEndpointProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.coingecko.com/api/v3',
  ));
  return CriptosEndpoint(dio);
});