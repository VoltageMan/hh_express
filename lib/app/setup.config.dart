// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hh_express/repositories/auth/auth_repositori.dart' as _i3;
import 'package:hh_express/repositories/auth/auth_repositori_impl.dart' as _i4;
import 'package:hh_express/repositories/categories/categories_repository.dart'
    as _i5;
import 'package:hh_express/repositories/categories/categories_repository_impl.dart'
    as _i6;
import 'package:hh_express/repositories/product_details/product_details_repository.dart'
    as _i7;
import 'package:hh_express/repositories/product_details/product_details_repository_impl.dart'
    as _i8;
import 'package:hh_express/repositories/products/product_repo.dart' as _i9;
import 'package:hh_express/repositories/products/product_repo_impl.dart'
    as _i10;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthRepo>(() => _i4.AuthRepoImpl());
    gh.factory<_i5.CategoryRepo>(() => _i6.CategoryRepoIMpl());
    gh.factory<_i7.ProductDetailsRepo>(() => _i8.ProductDetailsRepoImpl());
    gh.factory<_i9.ProductRepo>(() => _i10.ProductRepoImpl());
    return this;
  }
}
