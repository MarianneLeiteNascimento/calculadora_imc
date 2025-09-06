import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  final List<String> historico;

  const HistoricoPage({super.key, required this.historico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Histórico de IMC")),
      body: ListView.builder(
        itemCount: historico.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.calculate_outlined),
                title: Text(historico[index]),
              ),
              const SizedBox(height: 12),
            ],
          );
        },
      ),
      backgroundColor: const Color.fromRGBO(159, 205, 177, 1.0),
    );
  }
}
