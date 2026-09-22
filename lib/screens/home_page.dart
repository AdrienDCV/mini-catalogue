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
      backgroundColor: const Color(0xFFF6F6F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6F3),
        title: const Text('Mini-Catalogue'),
      ),
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
                  child: FilterChip(
                    label: Text(
                      'Afficher les favoris (${store.favouriteCount})',
                    ),
                    selected: state.favouritesOnly,
                    onSelected: (_) => store.toggleFavouritesFilter(),
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
