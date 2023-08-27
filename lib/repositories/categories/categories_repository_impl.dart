import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/features/categories/bloc/category_bloc.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/api/response_model.dart';
import 'package:hh_express/models/categories/category_model.dart';
import 'package:hh_express/repositories/categories/categories_repository.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoIMpl extends CategoryRepo with DioClientMixin {
  @override
  Future<Map<String, List<CategoryModel>>?> getAll() async {
    final response = await dio.get(endPoint: _endPoint(null));
    if (response.success) {
      final mains = (response.data[APIKeys.mainCategories] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
      final subs = (response.data[APIKeys.subCategories] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return {
        APIKeys.mainCategories: mains,
        APIKeys.subCategories: subs,
      };
    }
    return null;
  }

  @override
  Future<Map<String, List<CategoryModel>>?> getSubsBySlug(
      String slug, CancelToken cancleToken) async {
    final response =
        await dio.get(endPoint: _endPoint(slug), cancelToken: cancleToken);
    if (response.success) {
      final data = (response.data[APIKeys.subCategories] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return {
        slug: data,
      };
    }
    return null;
  }

  String _endPoint(String? slug) {
    if (slug == null) {
      return EndPoints.category;
    }
    return '${EndPoints.category}?slug=$slug';
  }
}
