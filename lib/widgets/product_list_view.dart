import 'package:flutter/material.dart';
import 'package:mobile/models/product_data.dart';
import 'package:mobile/widgets/product_card.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.products});

  final List<ProductData> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      itemCount: products.length,
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }
}