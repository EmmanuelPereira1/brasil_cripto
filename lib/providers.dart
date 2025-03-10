import 'package:brasil_cripto/core/data/data/data_source_coin_list.dart';
import 'package:brasil_cripto/core/data/repository/repository_coin_list.dart';
import 'package:brasil_cripto/core/local_storage/favorite_service.dart';
import 'package:brasil_cripto/core/remote/remote_client.dart';
import 'package:brasil_cripto/core/use_case/use_case_coin_list.dart';
import 'package:brasil_cripto/views/home/cubit/bloc_coin_list_cubit.dart';
import 'package:get_it/get_it.dart';

class AppGetIt {
  static GetIt instance = GetIt.instance;

  Future<void> setupProviders() async {
    instance.registerLazySingleton<AbstractRemoteClient>(() => RemoteClient());
    instance.registerLazySingleton<AbstractDataSourceCoinList>(
      () => DataSourceCoinList(),
    );
    instance.registerLazySingleton<AbstractRepositoryCoinList>(
      () => RepositoryCoinList(),
    );
    instance.registerLazySingleton<AbstractUseCaseCoinList>(
      () => UseCaseCoinList(),
    );
    instance.registerLazySingleton<BlocCoinListCubit>(
      () => BlocCoinListCubit(),
    );
    instance.registerLazySingleton<FavoriteService>(
      () => FavoriteService(),
    );
  }
}
