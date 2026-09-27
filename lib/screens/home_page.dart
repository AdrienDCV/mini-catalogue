import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/stores/app_store.dart';
import 'package:mobile/stores/app_state.dart';
import 'package:mobile/widgets/product_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini-Catalogue')),
      body: SafeArea(
        child: BlocBuilder<AppStore, AppState>(
          builder: (context, state) {
            final store = context.read<AppStore>();

            if (state.products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            final visibleProducts = store.visibleProducts;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilterChip(
                        label: Text('Favoris (${store.favouriteCount})'),
                        selected: state.favouritesOnly,
                        onSelected: (_) => store.toggleFavouritesFilter(),
                      ),
                      TextButton.icon(
                        onPressed: store.toggleDescriptions,
                        icon: Icon(
                          state.showDescriptions
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18,
                        ),
                        label: Text(
                          state.showDescriptions
                              ? 'Masquer les descriptions'
                              : 'Afficher les descriptions',
                        ),
                        style: TextButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          textStyle: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: visibleProducts.isEmpty
                      ? const Center(
                          child: Text('Aucun favori pour le moment.'),
                        )
                      : ProductListView(products: visibleProducts),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
