import 'package:flutter/material.dart';
import 'package:flutter_zapix/products/pallete.dart';

import '../../models/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  final Function? onTap;
  const ProductListItem({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Pallete.listBackground,
      ),
      height: 128,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                if (onTap != null) {
                  onTap!(product);
                }
              },
              icon: const Icon(
                Icons.add_shopping_cart,
                size: 32,
                color: Pallete.listText,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                width: 64,
                height: 64,
                child: Image.asset(
                  "assets/garfo.png",
                  scale: 1.5,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: Pallete.listText,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "R\$ ${product.price}",
                    style: const TextStyle(color: Pallete.listText),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
