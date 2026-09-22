import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/sample_products.dart';
import 'package:mobile/models/product_data.dart';

import 'app_state.dart';

class AppStore extends Cubit<AppState> {
  AppStore() : super(const AppState());

  List<ProductData> get visibleProducts => state.favouritesOnly
      ? state.products.where((product) => product.isFavourite).toList()
      : state.products;

  int get favouriteCount =>
      state.products.where((product) => product.isFavourite).length;

  Future<void> init() async {
    await loadProductList();
  }

  Future<void> loadProductList() async {
    emit(state.copyWith(products: buildSampleProducts()));
  }

  void toggleFavouritesFilter() {
    emit(state.copyWith(favouritesOnly: !state.favouritesOnly));
  }

  void toggleDescriptions() {
    emit(state.copyWith(showDescriptions: !state.showDescriptions));
  }

  void toggleFavourite(String productId) {
    emit(
      state.copyWith(
        products: [
          for (final product in state.products)
            product.id == productId
                ? product.copyWith(isFavourite: !product.isFavourite)
                : product,
        ],
      ),
    );
  }
}
