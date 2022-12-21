import 'package:flutter/material.dart';
import 'package:flutter_zapix/products/models/product.dart';
import 'package:flutter_zapix/products/pallete.dart';
import 'package:flutter_zapix/products/screens/cart_screen.dart';
import 'package:flutter_zapix/products/screens/widgets/product_list_item.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Product> listProduct = [
    Product(
      id: "P001",
      name: "Coxinha de Frango",
      price: 10.0,
      description: "Uma deliciosa coxinha com recheio de frango",
    ),
    Product(
      id: "P002",
      name: "Coxinha de Charque",
      price: 15.0,
      description: "Uma deliciosa coxinha com recheio de charque",
    ),
    Product(
      id: "P003",
      name: "Coxinha de Queijo",
      price: 8.50,
      description: "Uma deliciosa coxinha com recheio de charque",
    ),
    Product(
      id: "P004",
      name: "Refrigerante",
      price: 8,
      description: "O doce gosto do capitalismo",
    ),
    Product(
      id: "P005",
      name: "Energetico",
      price: 12,
      description: "Taquicardia e ansiedade",
    ),
  ];

  Map<String, int> onCart = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background,
      appBar: AppBar(
        title: const Text("DotShop"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CartScreen(listProduct: listProduct, onCart: onCart),
                ),
              );
            },
            icon: (onCart.values.isNotEmpty)
                ? Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.shopping_basket_rounded,
                          color: Pallete.listText,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(countProducts().toString()),
                      )
                    ],
                  )
                : const Icon(
                    Icons.shopping_basket_rounded,
                    color: Pallete.listText,
                  ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: List.generate(
            listProduct.length,
            (index) => ProductListItem(
              product: listProduct[index],
              onTap: addToCart,
            ),
          ),
        ),
      ),
    );
  }

  addToCart(Product product) {
    if (onCart.keys.contains(product.id)) {
      setState(() {
        onCart[product.id] = onCart[product.id]! + 1;
      });
    } else {
      setState(() {
        onCart[product.id] = 1;
      });
    }
  }

  int countProducts() {
    int count = 0;
    for (var element in onCart.values) {
      count += element;
    }
    return count;
  }
}
