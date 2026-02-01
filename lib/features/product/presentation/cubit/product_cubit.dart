import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/product/domain/use_cases/get_products_use_case.dart';
import 'package:fruits_app/features/product/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductCubit({required this.getProductsUseCase}) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    final result = await getProductsUseCase();
    result.fold(
      (error) => emit(ProductError(message: error)),
      (products) => emit(ProductLoaded(products: products)),
    );
  }
}
