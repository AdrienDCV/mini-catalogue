import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';

class AppStore extends Cubit<AppState> {
  AppStore() : super(const AppState());

  Future<void> init() async {
    await loadProductList();
  }

  Future<void> loadProductList() async {
    // load products...
  }
}
