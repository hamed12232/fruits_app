import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/favourite/presentation/cubit/favorite_state.dart';
import 'package:fruits_app/features/product/domain/entities/product_entity.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteLoaded(favorites: []));

  final List<ProductEntity> _favorites = [];

  void toggleFavorite(ProductEntity product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    emit(FavoriteLoaded(favorites: List.from(_favorites)));
  }

  bool isFavorite(ProductEntity product) {
    return _favorites.contains(product);
  }
}
