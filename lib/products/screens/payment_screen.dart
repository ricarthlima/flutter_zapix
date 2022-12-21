import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_zapix/products/pallete.dart';

class PaymentScreen extends StatefulWidget {
  final String name;
  final String cpf;
  final double amount;
  const PaymentScreen({
    super.key,
    required this.name,
    required this.cpf,
    required this.amount,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isPago = false;
  String imageB64 =
      "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";

  @override
  void initState() {
    //TODO: Enviar cobraça para API, guardar id e txid
    //TODO: Obter imagem da API
    //TODO: Verificar mudança do status via API
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pagamento com Pix")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (imageB64.isNotEmpty)
                ? Image.memory(base64Decode(imageB64))
                : Container(),
            Visibility(
              visible: !isPago,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 32,
                  ),
                  CircularProgressIndicator(color: Pallete.listText),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Aguardando Pagamento",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
