import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/models/product_data.dart';
import 'package:mobile/stores/app_store.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key, required this.product});

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isFavourite = product.isFavourite;

    return IconButton(
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: isFavourite ? colorScheme.primary : colorScheme.outline,
      ),
      tooltip: isFavourite ? 'Retirer des favoris' : 'Ajouter aux favoris',
      onPressed: () => context.read<AppStore>().toggleFavourite(product.id),
    );
  }
}
