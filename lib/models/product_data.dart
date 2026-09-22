import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_data.freezed.dart';

@freezed
abstract class ProductData with _$ProductData {
  const factory ProductData({
    required String id,
    required String name,
    String? description,
    double? price,
    @Default(Icons.inventory_2) IconData icon,
  }) = _ProductData;
}
