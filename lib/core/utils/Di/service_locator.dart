import 'package:fruits_app/core/network/dio_client.dart';
import 'package:fruits_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:fruits_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:fruits_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fruits_app/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:fruits_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:fruits_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:fruits_app/features/auth/modules/sign_in/presentation/cubit/login_cubit.dart';
import 'package:fruits_app/features/auth/modules/sign_up/presentation/cubit/register_cubit.dart';
import 'package:fruits_app/features/auth/modules/verify_number/presentation/cubit/forget_password_cubit.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/product/data/data_source/product_remote_data_source.dart';
import 'package:fruits_app/features/product/data/repository/product_repository_impl.dart';
import 'package:fruits_app/features/product/domain/repository/product_repository.dart';
import 'package:fruits_app/features/product/domain/use_cases/get_products_use_case.dart';
import 'package:fruits_app/features/product/presentation/cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';

/// Service locator instance
final sl = GetIt.instance;

/// Initialize all dependencies
Future<void> initServiceLocator() async {
  // Core
  sl.registerLazySingleton(() => DioClient.instance.dio);

  // Data sources
  sl.registerLazySingleton<BaseAuthRemoteDataSource>(
    () => AuthRemoteDataSource(dio: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(repository: sl()));

  // Cubits
  sl.registerFactory(() => LoginCubit(loginUseCase: sl()));
  sl.registerFactory(() => RegisterCubit(registerUseCase: sl()));
  sl.registerFactory(() => ForgetPasswordCubit(forgetPasswordUseCase: sl()));
  // Product Feature
  sl.registerLazySingleton<BaseProductRemoteDataSource>(
    () => ProductRemoteDataSource(dio: sl()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetProductsUseCase(repository: sl()));
  sl.registerFactory(() => ProductCubit(getProductsUseCase: sl()));

  // Basket Feature
  sl.registerLazySingleton(() => CartCubit());
}
