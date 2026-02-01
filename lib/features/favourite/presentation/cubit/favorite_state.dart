import 'package:equatable/equatable.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<ProductEntity> favorites;

  const FavoriteLoaded({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError(this.message);

  @override
  List<Object> get props => [message];
}
