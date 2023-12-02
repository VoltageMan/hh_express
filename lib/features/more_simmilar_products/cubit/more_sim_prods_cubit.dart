import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'more_sim_prods_state.dart';

class MoreSimProdsCubit extends Cubit<MoreSimProdsState> {
  MoreSimProdsCubit() : super(MoreSimProdsInitial());
}
