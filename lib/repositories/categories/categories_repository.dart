import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hh_express/models/categories/category_model.dart';

abstract class CategoryRepo {
  Future<Map<String, List<CategoryModel>>?> getAll();
  Future<Map<String, List<CategoryModel>>?> getSubsBySlug(
      String slug, CancelToken cancleToken);
}
