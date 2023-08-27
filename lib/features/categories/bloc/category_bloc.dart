import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/categories/category_model.dart';
import 'package:hh_express/repositories/categories/categories_repository.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final repo = getIt<CategoryRepo>();
  CategoryBloc() : super(CategoryState(state: CategoryAPIState.init)) {
    on<InitCategories>((event, emit) async {
      if (state.state == CategoryAPIState.init ||
          state.state == CategoryAPIState.error) {
        //
        emit(CategoryState(state: CategoryAPIState.loading));
        final data = await repo.getAll();
        //
        if (data == null) {
          'nullData'.log();
          emit(CategoryState(state: CategoryAPIState.error));
          return;
        }
        //
        final mains = data[APIKeys.mainCategories];
        emit(
          CategoryState(
            state: CategoryAPIState.succses,
            activIndex: 0,
            mains: List<CategoryModel>.from(mains!),
            subs: Map<String, List<CategoryModel>>.from({
              mains.first.slug:
                  List<CategoryModel>.from(data[APIKeys.subCategories]!),
            }),
          ),
        );
        'Succses emit'.log();
      }
      return;
    });
    on<ChangeCategory>((event, emit) async {
      final index =
          state.mains!.map((e) => e.slug).toList().indexOf(event.slug);
      if (state.state == CategoryAPIState.loadingSubs) {
        state.cancelToken?.cancel();
        await checkSubExisting(event.slug, emit, index);
      }

      await checkSubExisting(event.slug, emit, index);
    });

    //
  }

  // Future<void> _getSubs(String slug) async {
  //   final cancelToken = CancelToken();
  //   emit(
  //     CategoryState(
  //       state: CategoryAPIState.loadingSubs,
  //       activIndex: state.activIndex,
  //       cancelToken: cancelToken,
  //       mains: state.mains,
  //     ),
  //   );
  //   await repo.getSubsBySlug(
  //     slug,
  //     cancelToken,
  //   );
  // }
  Future<void> checkSubExisting(
      String slug, Emitter<CategoryState> emit, int index) async {
    final theSubs = state.subs![slug];
    if (theSubs == null) {
      await getAddSubs(slug, emit, index);
      return;
    }
    emit(
      CategoryState(
        state: CategoryAPIState.succses,
        activIndex: index,
        mains: List<CategoryModel>.from(state.mains!),
        subs: Map<String, List<CategoryModel>>.from(state.subs!),
      ),
    );
    return;
  }

  Future<void> getAddSubs(
      String slug, Emitter<CategoryState> emit, int index) async {
    final newCancelToken = CancelToken();
    emit(
      CategoryState(
        state: CategoryAPIState.loadingSubs,
        activIndex: index,
        cancelToken: newCancelToken,
        mains: List<CategoryModel>.from(state.mains!),
        subs: Map<String, List<CategoryModel>>.from(state.subs!),
      ),
    );

    final data = await repo.getSubsBySlug(slug, newCancelToken);
    if (data == null) {
      emit(
        CategoryState(
          state: CategoryAPIState.errorSubs,
          activIndex: index,
          mains: List<CategoryModel>.from(state.mains!),
          subs: Map<String, List<CategoryModel>>.from(state.subs!),
        ),
      );
      return;
    }
    emit(
      CategoryState(
        state: CategoryAPIState.succses,
        activIndex: index,
        cancelToken: newCancelToken,
        mains: List<CategoryModel>.from(state.mains!),
        subs: Map<String, List<CategoryModel>>.from(state.subs!)..addAll(data),
      ),
    );
  }
}
