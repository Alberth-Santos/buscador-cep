class CepModel {
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
  });
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  factory CepModel.fromJson(Map<String, dynamic> json) => CepModel(
        cep: json['cep'],
        logradouro: json['logradouro'],
        bairro: json['bairro'],
        localidade: json['localidade'],
      );

  Map<String, dynamic> toJson() => {
        'cep': cep,
        'logradouro': logradouro,
        'bairro': bairro,
        'localidade': localidade,
      };
}
