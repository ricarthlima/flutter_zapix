import 'package:flutter/material.dart';
import 'package:flutter_zapix/products/screens/payment_screen.dart';

import '../models/product.dart';
import '../pallete.dart';

class CartScreen extends StatefulWidget {
  final List<Product> listProduct;
  final Map<String, int> onCart;

  const CartScreen({
    super.key,
    required this.listProduct,
    required this.onCart,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carrinho")),
      body: Stack(
        children: [
          ListView(
            children: List.generate(
              widget.onCart.keys.toList().length,
              (index) {
                String key = widget.onCart.keys.toList()[index];
                Product product = widget.listProduct
                    .where((element) => element.id == key)
                    .first;

                return ListTile(
                  title: Text(
                    product.name,
                    style: const TextStyle(
                      color: Pallete.listText,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    "R\$ ${product.price * widget.onCart[key]!}",
                    style: const TextStyle(color: Pallete.listText),
                  ),
                  trailing: SizedBox(
                    width: 64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.onCart[key] = widget.onCart[key]! - 1;
                              if (widget.onCart[key] == 0) {
                                widget.onCart.remove(key);
                              }
                            });
                          },
                          child: const Text(
                            "-",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Text(
                          widget.onCart[key]!.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.onCart[key] = widget.onCart[key]! + 1;
                            });
                          },
                          child: const Text(
                            "+",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: R\$${calcTotal()}",
                  style: const TextStyle(
                      color: Pallete.listText,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                ElevatedButton(
                  onPressed: () {
                    showInfoDialog();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Pallete.listBackground),
                  ),
                  child: const Text(
                    "FINALIZAR COMPRA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double calcTotal() {
    double total = 0;

    for (var key in widget.onCart.keys) {
      Product product =
          widget.listProduct.where((element) => element.id == key).first;
      total += product.price * widget.onCart[key]!;
    }

    return total;
  }

  showInfoDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController cpfController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Informe seus dados"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      label: Text("Nome Completo"),
                    ),
                  ),
                  TextField(
                    controller: cpfController,
                    decoration: const InputDecoration(
                      label: Text("CPF"),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("CANCELAR"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        name: nameController.text,
                        cpf: cpfController.text,
                        amount: calcTotal(),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "GERAR PEDIDO",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
  }
}
