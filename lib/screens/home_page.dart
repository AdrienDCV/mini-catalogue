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
        title: const Text('Catalogue'),
      ),
      body: SafeArea(
        child: BlocBuilder<AppStore, AppState>(
          builder: (context, state) {
            final products = state.products;
            if (products.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ProductListView(products: products);
          },
        ),
      ),
    );
  }
}