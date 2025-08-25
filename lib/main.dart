import 'package:flutter/material.dart';
import 'definir_imc.dart';

void main() {
  runApp(const MainApp());
}

double peso = 0.0;
double altura = 0.0;
double imcParaAnalisar = 0.0;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  double resultadoImc = 0.0;
  String resultadoImcTexto = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calculadora IMC',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: controllerAltura,
                  decoration: const InputDecoration(
                    labelText: 'Altura',
                    hintText: "Informe sua altura (ex: 1.75)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: controllerPeso,
                  decoration: const InputDecoration(
                    labelText: 'Peso',
                    hintText: 'Informe seu peso (ex: 70.5)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  resultadoImcTexto,
                  style: const TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  imcAnalisado(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        peso = double.tryParse(controllerPeso.text) ?? 0.0;
                        altura = double.tryParse(controllerAltura.text) ?? 0.0;
                        resultadoImc = calcularImc(peso, altura);
                        imcParaAnalisar = resultadoImc;
                        resultadoImcTexto = resultadoImc > 0
                            ? resultadoImc.toStringAsFixed(2)
                            : '';
                      });
                    },
                    child: const Text('Calcular'),
                  ),
                ),
                const SizedBox(height: 80),
                const Expanded(
                  child: Text(
                    'Importante: \n'
                    'Esta calculadora é apenas uma ferramenta educativa e não substitui avaliação médica. '
                    'O resultado pode não refletir sua real condição de saúde, pois não considera fatores como idade, sexo, '
                    'composição corporal e histórico clínico. Para uma análise completa, consulte um profissional de saúde.',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(159, 205, 177, 1.0),
      ),
    );
  }
}
