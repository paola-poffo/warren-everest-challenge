import '../../shared/api/models/all_criptos_response.dart';
import '../../shared/api/models/criptos_response.dart';
import '../../shared/api/models/endpoints/criptos_endpoint.dart';

class CriptosRepository {
  final CriptosEndpoint endpoint;

  CriptosRepository(this.endpoint);

  Future<AllCriptosResponse> getAllCriptos() async {
    final response = await endpoint.getCriptos();

    return AllCriptosResponse(
      List.from(
        response.data.map(
          (cripto) {
            return CriptosResponse.fromJson(cripto);
          },
        ),
      ),
    );
  }
}
