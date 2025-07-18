import 'package:almusafir_direct/features/checkout/domain/usecases/services/get_flights_uescases.dart';
import 'package:almusafir_direct/features/profile/domain/usecases/delete_avatar_usecases.dart';
import 'package:almusafir_direct/features/profile/domain/usecases/get_paymens_available.usecases.dart';
import 'package:almusafir_direct/features/service/domain/repositories/service_repositories.dart';
import 'package:almusafir_direct/features/service/domain/usecases/get_other_services.uescases.dart';
import 'package:almusafir_direct/features/service/presentation/cubit/other_services_cubit.dart';
import 'package:almusafir_direct/features/shopping/presentation/logic/shop_products_cubit/shop_products_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/api.service.dart';
import 'core/services/network_info.dart';
import 'features/auth/data/dataSourse/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repotitorises_imp.dart';
import 'features/auth/domain/repositories/auth_repostitorise.dart';
import 'features/auth/domain/usecases/check_activation.usescases.dart';
import 'features/auth/domain/usecases/login_usescases.dart';
import 'features/auth/domain/usecases/register.usecases.dart';
import 'features/auth/domain/usecases/send_activation.usecases.dart';
import 'features/auth/persention/logic/auth_bloc/auth_bloc.dart';
import 'features/auth/persention/logic/register_cubit/register_cubit.dart';
import 'features/auth/persention/logic/verify_cubit/verify_cubit.dart';
import 'features/cart/data/datasources/cart_remote_datasources.dart';
import 'features/cart/data/repositories/cart_repositories_imp.dart';
import 'features/cart/domain/repositories/cart_repositories.dart';
import 'features/cart/domain/usecases/add_cartusecases.dart';
import 'features/cart/domain/usecases/delete_cartusecases.dart';
import 'features/cart/domain/usecases/get_cartusecases.dart';
import 'features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'features/cart/presentation/logic/product_card_cubit/product_card_cubit.dart';
import 'features/chat/data/datasources/chat_remote_datasources.dart';
import 'features/chat/data/repositories/chat_repositories_imp.dart';
import 'features/chat/domain/repositories/chat_repositories.dart';
import 'features/chat/domain/usecases/chat_with_openai.usecases.dart';
import 'features/chat/presentation/logic/chat_with_openai_cubit/chat_with_openai_cubit.dart';
import 'features/checkout/data/datasources/checkout_remote_datasources.dart';
import 'features/checkout/data/repositories/checkout_repositories_imp.dart';
import 'features/checkout/domain/repositories/checkout_repositories.dart';
import 'features/checkout/domain/usecases/services/checkout2_uescases.dart';
import 'features/checkout/domain/usecases/services/get_airport_uescases.dart';
import 'features/checkout/domain/usecases/services/get_loads_types_uescases.dart';
import 'features/checkout/domain/usecases/services/get_payment_methods_uescases.dart';
import 'features/checkout/domain/usecases/services/get_vehicle_type_uescases.dart';
import 'features/checkout/presentation/logic/form_checkout_cubit/form_checkout_cubit.dart';
import 'features/checkout/presentation/logic/form_service_cubit/form_service_cubit.dart';
import 'features/explore/data/datasources/explore_remote_datasources.dart';
import 'features/explore/data/repositories/explore_repositories_imp.dart';
import 'features/explore/domain/repositories/explore_repositories.dart';
import 'features/explore/domain/usecases/get_explore.uescases.dart';
import 'features/explore/domain/usecases/get_type_explore.uescases.dart';
import 'features/explore/presentation/logic/explore_bloc/explore_bloc.dart';
import 'features/explore/presentation/logic/explore_type_cubit/explore_type_cubit.dart';
import 'features/home/data/datasources/home_local_datasource.dart';
import 'features/home/data/datasources/home_remote_datasources.dart';
import 'features/home/data/repositories/home_repositories_imp.dart';
import 'features/home/domain/repositories/home_repositories.dart';
import 'features/home/domain/usecases/get_all_data_uescases.dart';
import 'features/home/presentation/logic/bloc/home_bloc.dart';
import 'features/order/data/datasources/order_remote_datasources.dart';
import 'features/order/data/repositories/order_repositories_imp.dart';
import 'features/order/domain/repositories/order_repositories.dart';
import 'features/order/domain/usecases/get_orders.usecases.dart';
import 'features/order/presentation/logic/order_cubit/order_cubit.dart';
import 'features/profile/data/dataSourse/profile_data_sourse.dart';
import 'features/profile/data/repositories/profile_repositories_imp.dart';
import 'features/profile/domain/repositories/profile_repositories.dart';
import 'features/profile/domain/usecases/change_avatar_usecases.dart';
import 'features/profile/domain/usecases/contactus_usecases.dart';
import 'features/profile/domain/usecases/delete_usecases.dart';
import 'features/profile/domain/usecases/get_points.usecases.dart';
import 'features/profile/domain/usecases/get_referral.usecase.dart';
import 'features/profile/domain/usecases/get_statistical_points.usecases.dart';
import 'features/profile/domain/usecases/logout_usecases.dart';
import 'features/profile/domain/usecases/update_user_profile.usecases.dart';
import 'features/profile/presention/bloc/contact_us_cubit/contact_us_cubit.dart';
import 'features/profile/presention/bloc/payment_methods_cubit/payment_methods_cubit.dart';
import 'features/profile/presention/bloc/point_cubit/point_cubit.dart';
import 'features/profile/presention/bloc/profile_bloc/profile_bloc.dart';
import 'features/profile/presention/bloc/referral_bloc/referral_bloc.dart';
import 'features/service/data/datasources/service_remote_datasources.dart';
import 'features/service/data/repositories/service_repositories_imp.dart';
import 'features/shopping/data/datasources/department_remote_datasources.dart';
import 'features/shopping/data/repositories/department_repositories_imp.dart';
import 'features/shopping/domain/repositories/department_repositories.dart';
import 'features/shopping/domain/usecases/get_departments_uescases.dart';
import 'features/shopping/domain/usecases/get_shop_products_uescases.dart';
import 'features/shopping/domain/usecases/get_type_departments_uescases.dart';
import 'features/shopping/presentation/logic/department_bloc/department_bloc.dart';
import 'features/shopping/presentation/logic/department_type_cubit/department_type_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! features - posts

  //? Bloc
  sl.registerFactory(() => AuthBloc(loginUseCases: sl()));

  sl.registerFactory(() => RegisterCubit(registerUseCases: sl()));
  sl.registerFactory(() => VerifyCubit(
        checkActivationUseCases: sl(),
        sendActivationUseCases: sl(),
      ));

  //home
  sl.registerFactory(() => HomeBloc(fetchAllData: sl()));

  sl.registerFactory(() => ProfileBloc(
      updateUserProfileUseCases: sl(),
      deleteAccountUseCases: sl(),
      changeAvatarUsecases: sl(),
      deleteAvatarUsecases: sl(),
      logoutDriverUseCases: sl()));

  sl.registerFactory(
      () => PaymentMethodsCubit(getPaymentMethodsAvailablesUsecases: sl()));

  sl.registerFactory(() =>
      PointCubit(getPointsUseCases: sl(), getStatisticalPointsUseCases: sl()));

  sl.registerFactory(() => ReferralBloc(getReferralUseCase: sl()));

  sl.registerFactory(() => ContactUsCubit(contactUsUsecases: sl()));

  sl.registerFactory(() => FormCheckoutCubit(checkout2Uescases: sl()));
  sl.registerFactory(() => FormServiceCubit(
      getAirportUescases: sl(),
      getLoadsTypesUescases: sl(),
      getPaymentMethodsUescases: sl(),
      getFlightsUescases: sl(),
      getVehicleTypeUescases: sl()));

  sl.registerFactory(
      () => OtherServicestsCubit(getOtherServicesUescases: sl()));

  //Explore
  sl.registerFactory(() => ExploreTypeCubit(getTypeExploresUescases: sl()));

  sl.registerFactory(() => ExploreBloc(getExploresUescases: sl()));

  //Departments
  sl.registerFactory(
      () => DepartmentTypeCubit(getTypeDepartmentsUescases: sl()));

  sl.registerFactory(() => DepartmentBloc(getDepartmentsUescases: sl()));

  sl.registerFactory(() => ShopProductsCubit(getShopProductsUescases: sl()));

  sl.registerFactory(
      () => ChatWithOpenaiCubit(chatWithOpenaiDataUsecases: sl()));

//order
  sl.registerFactory(() => OrderCubit(getOrdersUescases: sl()));
//cart
  sl.registerFactory(
      () => CartCubit(getCartUescases: sl(), deleteCartUescases: sl()));

  sl.registerFactory(() => ProductCardCubit(addToCartUescases: sl()));

  //=============================

  //? UseCase
  //Auth
  sl.registerLazySingleton(() => LoginUseCases(sl()));

  sl.registerLazySingleton(() => RegisterUseCases(sl()));
  sl.registerLazySingleton(() => SendActivationUseCases(sl()));
  sl.registerLazySingleton(() => CheckActivationUseCases(sl()));

  //Profile
  sl.registerLazySingleton(() => UpdateUserProfileUsecases(sl()));
  sl.registerLazySingleton(() => ChangeAvatarUsecases(sl()));
  sl.registerLazySingleton(() => LogoutDriverUseCases(sl()));
  sl.registerLazySingleton(() => DeleteAccountUseCases(sl()));
  sl.registerLazySingleton(() => DeleteAvatarUsecases(sl()));
  sl.registerLazySingleton(() => ContactUsUsecases(sl()));
  sl.registerLazySingleton(() => GetReferralUseCase(sl()));
  sl.registerLazySingleton(() => GetPointsUseCases(sl()));
  sl.registerLazySingleton(() => GetStatisticalPointsUseCases(sl()));
  sl.registerLazySingleton(() => GetPaymentMethodsAvailablesUsecases(sl()));

  //setting
  sl.registerLazySingleton(() => FetchAllDataUseCases(sl()));

  //checkout
  sl.registerLazySingleton(() => Checkout2Uescases(sl()));
  sl.registerLazySingleton(() => GetAirportUescases(sl()));
  sl.registerLazySingleton(() => GetVehicleTypeUescases(sl()));
  sl.registerLazySingleton(() => GetLoadsTypesUescases(sl()));
  sl.registerLazySingleton(() => GetPaymentMethodsUescases(sl()));
  sl.registerLazySingleton(() => GetFlightsUescases(sl()));

  //Services
  sl.registerLazySingleton(() => GetOtherServicesUescases(sl()));
  //Explore
  sl.registerLazySingleton(() => GetTypeExploresUescases(sl()));
  sl.registerLazySingleton(() => GetExploresUescases(sl()));

  //Departments
  sl.registerLazySingleton(() => GetTypeDepartmentsUescases(sl()));
  sl.registerLazySingleton(() => GetDepartmentsUescases(sl()));
  sl.registerLazySingleton(() => GetShopProductsUescases(sl()));

  //chat
  sl.registerLazySingleton(() => ChatWithOpenaiDataUsecases(sl()));

  //order
  sl.registerLazySingleton(() => GetOrdersUescases(sl()));

  //cart
  sl.registerLazySingleton(() => GetCartUescases(sl()));
  sl.registerLazySingleton(() => AddToCartUescases(sl()));
  sl.registerLazySingleton(() => DeleteCartUescases(sl()));

  //===========================================================

  //? Repository
  sl.registerLazySingleton<AuthRepostitory>(() => AuthRepostitoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<ProfileRepostitory>(() =>
      ProfileRepostitoryImpl(profileRemoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<HomeRepostitory>(() => HomeRepostitoryImp(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  //Checkout
  sl.registerLazySingleton<CheckoutRepostitory>(() => CheckoutRepostitoryImp(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
  //Services
  sl.registerLazySingleton<ServiceRepostitory>(() => ServiceRepostitoryImp(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  //Explore
  sl.registerLazySingleton<ExploreRepostitory>(() => ExploreRepostitoryImp(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  //Departments
  sl.registerLazySingleton<DepartmentRepostitory>(
      () => DepartmentRepostitoryImp(
            remoteDataSource: sl(),
            networkInfo: sl(),
          ));

  //chat
  sl.registerLazySingleton<ChatRepostitory>(() => ChatRepostitoryImp(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
  //order
  sl.registerLazySingleton<OrderRepostitory>(() => OrderRepostitoryImp(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
  //cart
  sl.registerLazySingleton<CartRepostitory>(() => CartRepostitoryImp(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
  //=============================

  //? Datasources

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteImplWithDio(apiService: sl()));

  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteImpWithDio(client: sl()));

  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImplWithDio(apiService: sl()));
  //checkout
  sl.registerLazySingleton<CheckoutRemoteDataSource>(
      () => CheckoutRemoteDataSourceImplWithDio(apiService: sl()));

  //Service
  sl.registerLazySingleton<ServiceRemoteDataSource>(
      () => ServiceRemoteDataSourceImplWithDio(apiService: sl()));

  //Explore
  sl.registerLazySingleton<ExploreRemoteDataSource>(
      () => ExploreRemoteDataSourceImplWithDio(apiService: sl()));

  //Departments
  sl.registerLazySingleton<DepartmentRemoteDataSource>(
      () => DepartmentRemoteDataSourceImplWithDio(apiService: sl()));

  //chat
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceeImplWithDio(apiService: sl()));

  //order
  sl.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceeImplWithDio(apiService: sl()));
  //cart
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceeImplWithDio(apiService: sl()));

  //=============================

  //? LocalDataSource
  sl.registerLazySingleton<HomeLocalDatasource>(
      () => HomeLocalDataSourceImpl(sharedPreferences: sl()));

  //=============================

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(connectionChecker: sl()));

  //! External
  //? sharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => ApiService(sl()));
  sl.registerLazySingleton(() => InternetConnection());
}
