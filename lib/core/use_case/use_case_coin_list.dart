import 'package:brasil_cripto/core/data/repository/repository_coin_list.dart';
import 'package:brasil_cripto/core/entity/entity_coin_list.dart';
import 'package:brasil_cripto/core/enums/enum_error.dart';
import 'package:brasil_cripto/core/generics/generic_state.dart';
import 'package:brasil_cripto/providers.dart';

abstract class AbstractUseCaseCoinList {
  Future<GenericState<List<EntityCoinList>, EnumError>> useCaseCoinList();
}

class UseCaseCoinList implements AbstractUseCaseCoinList{
  final _repositoryCoinList = AppGetIt.instance<AbstractRepositoryCoinList>();
  @override
  Future<GenericState<List<EntityCoinList>, EnumError>> useCaseCoinList() async {
    final response = await _repositoryCoinList.repositoryCoinList();

    if(response.hasError || response.data == null) {
      return GenericState.failed(error: EnumError.error);
    } else {
      return GenericState.success(data: response.data!);
    }
  }
}