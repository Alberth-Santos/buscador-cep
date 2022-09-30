import 'package:buscando_cep/repositories/cep_repository.dart';
import 'package:flutter/material.dart';

import '../../models/cep_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "";
  final cepController = TextEditingController();
  final repository = CepRepository();

  getCepFromWs() async {
    CepModel cepModel = await repository.getCep(cepController.value.text);
    setState(() {
      result =
          '${cepModel.logradouro}, ${cepModel.bairro} - ${cepModel.localidade}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscador de CEP"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Digite seu CEP :",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 60,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.always,
              controller: cepController,
              decoration: const InputDecoration(
                labelText: "CEP",
                hintText: "Ex.: 12345-678",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.cyan,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    getCepFromWs();
                  });
                },
                child: const Text("Clique")),
            Text("$result")
          ],
        ),
      ),
    );
  }
}
