import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/helpers/overlay_helper.dart';
import 'package:hh_express/helpers/routes.dart';
import 'package:hh_express/models/addres/address_model.dart';
import 'package:hh_express/models/pagination/pagination_model.dart';
import 'package:hh_express/repositories/address/address_repo.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/enums.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressState(state: AddressApiState.init));
  final _repo = getIt<AddressRepo>();

  final selectedAddresIndex = 0;
  Future<void> create(String address) async {
    if (address.length < 5) {
      'address Must BeMore Than 5 Symbols'.log();
      SnackBarHelper.showTopSnack(
          'address Must BeMore Than 5 Symbols', APIState.error);

      /// show fail message
      return;
    }
    OverlayHelper.showLoading();
    final response = await _repo.create(address);
    bool isSucceed = false;
    if (response != null) {
      isSucceed = true;
      emit(
        AddressState(
          state: AddressApiState.succses,
          models: List.from(state.models)..add(response),
        ),
      );
    }
    SnackBarHelper.showTopSnack(
      isSucceed ? 'Succes' : 'some Thins went Wrong',
      isSucceed ? APIState.succses : APIState.error,
    );
    OverlayHelper.remove();
  }

  Future<void> init({bool forUpdate = false}) async {
    emit(
      AddressState(
        state: AddressApiState.loading,
        models: List.empty(growable: true),
      ),
    );
    final data = await _repo.read(0)
      ..log(message: 'AddressData');
    if (data != null) {
      return emit(
        AddressState(
          state: AddressApiState.succses,
          models: List.from(data[APIKeys.data]),
          pagination: data[APIKeys.pagination],
        ),
      );
    }

    return emit(AddressState(state: AddressApiState.error));
  }

  Future<void> update(AddressModel model) async {
    if (model.address.length < 5) {
      SnackBarHelper.showTopSnack(
          'address Must BeMore Than 5 Symbols', APIState.error);

      /// show fail message
      return;
    }
    OverlayHelper.showLoading();
    final response = await _repo.update(model);
    bool isSucceed = false;
    if (response != null) {
      isSucceed = true;
      final newModels = List<AddressModel>.from(state.models);
      final removeIndex =
          newModels.map((e) => e.uuid).toList().indexOf(model.uuid);
      newModels.removeAt(removeIndex);
      emit(
        AddressState(
          state: AddressApiState.succses,
          models: newModels..add(response),
        ),
      );
    }

    SnackBarHelper.showTopSnack(
      isSucceed ? 'Succes' : 'some Thins went Wrong',
      isSucceed ? APIState.succses : APIState.error,
    );
    OverlayHelper.remove();
  }
}
