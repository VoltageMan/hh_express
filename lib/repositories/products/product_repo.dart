import 'package:flutter/material.dart';
import 'package:hh_express/settings/enums.dart';

abstract class ProductRepo {
  Future<Map<String, dynamic>?> getProducts({
    required List<String> slugs,
    required List<int> properties,
    required int page,
  });
  bool doLoadMore(ScrollController scrollController, ProductAPIState state);
}
