// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:brasil_cripto/core/entity/entity_coin_list.dart';
import 'package:brasil_cripto/core/use_case/use_case_coin_list.dart';
import 'package:brasil_cripto/providers.dart';
import 'package:meta/meta.dart';

part 'bloc_coin_list_state.dart';

class BlocCoinListCubit extends Cubit<BlocCoinListState> {
  final _useCaseCoinList = AppGetIt.instance.get<AbstractUseCaseCoinList>();
  List<EntityCoinList>? entity;

  BlocCoinListCubit() : super(BlocCoinListInitial());

  Future<void> fetchCoinList() async {
    final result = await _useCaseCoinList.useCaseCoinList();
    if (result.hasError || result.data == null) {
      emit(BlocError());
    } else {
      emit(BlocSuccess(entity: result.data!));
    }
  }
}
