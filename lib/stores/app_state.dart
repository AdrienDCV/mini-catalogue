import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/models/product_data.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default([]) List<ProductData> products,
    @Default(false) bool favouritesOnly,
  }) = _AppState;
}
