import 'package:flutter_application_1/main.dart';
import 'package:test/test.dart';
import 'package:flutter_application_1/definir_imc.dart';

void main() {
  group(
    "Verifica se as funções relacionadas ao cálculo e classificação funcionam corretamente",
    () {
      test("Verifica a função de cálculo", () {
        final valoresTeste1 = calcularImc(70, 1.75);
        expect(valoresTeste1, closeTo(22.86, 0.01));
      });

      test("Verifica a função de clasificação do imc", () {
        imcParaAnalisar = 22.86;
        final valorTeste2 = imcAnalisado();
        expect(valorTeste2, equals("Peso ideal"));
      });
    },
  );
}
