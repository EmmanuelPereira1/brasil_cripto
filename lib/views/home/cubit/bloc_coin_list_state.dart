part of 'bloc_coin_list_cubit.dart';

@immutable
sealed class BlocCoinListState {
  const BlocCoinListState();

  List<Object?> get props => [];
}

class BlocCoinListInitial extends BlocCoinListState {}

class BlocLoading extends BlocCoinListState {}

class BlocError extends BlocCoinListState {}

class BlocSuccess extends BlocCoinListState {
  final List<EntityCoinList>? entity;

  const BlocSuccess({this.entity});

  BlocSuccess copyWith({final List<EntityCoinList>? entity}) {
    return BlocSuccess(entity: entity ?? this.entity);
  }

  @override
  List<Object?> get props => [entity];
}
