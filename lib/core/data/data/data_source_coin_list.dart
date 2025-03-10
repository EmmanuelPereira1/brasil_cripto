import 'package:brasil_cripto/core/enums/enum_error.dart';
import 'package:brasil_cripto/core/generics/generic_state.dart';
import 'package:brasil_cripto/core/remote/remote_client.dart';
import 'package:brasil_cripto/providers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AbstractDataSourceCoinList {
  Future<GenericState<dynamic, EnumError>> dataSourceCoinList();
}

class DataSourceCoinList implements AbstractDataSourceCoinList{
  final _remoteClient = AppGetIt.instance<AbstractRemoteClient>();

  @override
  Future<GenericState<dynamic, EnumError>> dataSourceCoinList() async {
    final response = await _remoteClient.get(dotenv.env['API_URL'] ?? "URL NOT FOUND");

    if (response.statusCode != 200 || response.data == null ){
      return GenericState.failed(error: EnumError.error);
    }
    return GenericState.success(data: response.data!);
  }
}