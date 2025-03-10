import 'package:brasil_cripto/core/data/data/data_source_coin_list.dart';
import 'package:brasil_cripto/core/entity/entity_coin_list.dart';
import 'package:brasil_cripto/core/enums/enum_error.dart';
import 'package:brasil_cripto/core/generics/generic_state.dart';
import 'package:brasil_cripto/providers.dart';

abstract class AbstractRepositoryCoinList{
  Future<GenericState<List<EntityCoinList>, EnumError>> repositoryCoinList();
}

class RepositoryCoinList implements AbstractRepositoryCoinList{
  final _dataSourceCoinList = AppGetIt.instance.get<AbstractDataSourceCoinList>();

  @override
  Future<GenericState<List<EntityCoinList>, EnumError>> repositoryCoinList() async {
    try {
   final response = await _dataSourceCoinList.dataSourceCoinList();
      if (response.hasError) {
        return GenericState.failed(error: EnumError.error);
      }
      List<EntityCoinList> coinList = List<EntityCoinList>.from(
          response.data.map((coin) => EntityCoinList.fromJson(coin))
      );
      return GenericState.success(data: coinList);
    } catch (_) {
      return GenericState.failed(error: EnumError.error);
    }
  }
}