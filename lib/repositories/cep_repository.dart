import 'package:buscando_cep/models/cep_model.dart';
import 'package:dio/dio.dart';

class CepRepository {
  var dio = Dio();

  getCep(String? cep) async {
    final response = await dio.get('https://viacep.com.br/ws/$cep/json');
    CepModel model = CepModel.fromJson(response.data);
    return model;
  }
}
