import 'package:flutter_application_1/main.dart';

double calcularImc(double peso, double altura) {
  if (peso > 0 && altura > 0) {
    return peso / (altura * altura);
  }
  return 0.0;
}

String imcAnalisado() {
  if (imcParaAnalisar > 0 && imcParaAnalisar < 18.5) {
    return magreza;
  } else if (imcParaAnalisar >= 18.5 && imcParaAnalisar <= 24.9) {
    return ideal;
  } else if (imcParaAnalisar >= 25.0 && imcParaAnalisar <= 29.9) {
    return sobrepeso;
  } else if (imcParaAnalisar >= 30.0 && imcParaAnalisar <= 34.9) {
    return obesidade1;
  } else if (imcParaAnalisar >= 35.0 && imcParaAnalisar <= 39.9) {
    return obesidade2;
  } else if (imcParaAnalisar >= 40) {
    return obesidade3;
  } else {
    return naoEncontrado;
  }
}

const magreza = "Magreza";
const ideal = "Peso ideal";
const sobrepeso = "Sobrepeso";
const obesidade1 = "Obesidade Grau I";
const obesidade2 = "Obesidade Grau II";
const obesidade3 = "Obesidade Grau III";
const naoEncontrado = "Por favor, informe seus dados para o cálculo";
