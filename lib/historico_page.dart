import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'main.dart';

class HistoricoPage extends StatelessWidget {
  HistoricoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var imcBox = historicoImcBox;
    var analisesBox = historicoAnalisesBox;

    return Scaffold(
      appBar: AppBar(title: const Text("Histórico de IMC")),
      body: ValueListenableBuilder(
        valueListenable: imcBox.listenable(),
        builder: (context, Box imcsBox, _) {
          var imcs = imcsBox.values.toList();

          return ValueListenableBuilder(
            valueListenable: analisesBox.listenable(),
            builder: (context, Box analisesB, _) {
              var analises = analisesB.values.toList();
              int total = imcs.length;

              return ListView.builder(
                itemCount: total,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text("Resultados anteriores:"),
                    subtitle: Text(
                      "IMC: ${imcs[index]} \nAnálise: ${analises[index]}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        imcBox.deleteAt(index);
                        analisesBox.deleteAt(index);
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      backgroundColor: const Color.fromRGBO(159, 205, 177, 1.0),
    );
  }
}
