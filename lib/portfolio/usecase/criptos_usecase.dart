import '../mapper/criptos_mapper.dart';
import '../model/criptos_view_data.dart';
import '../repository/criptos_repository.dart';

class CriptosUsecase {
  final CriptosRepository repository;
  CriptosUsecase(this.repository);

  Future<List<CriptoViewData>> execute() async {
    final response = await repository.getAllCriptos();
    return response.toViewData();
  }
}
