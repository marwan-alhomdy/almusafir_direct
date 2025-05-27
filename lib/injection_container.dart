import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/controller/work_on_servers/network/network_info.dart';
import 'features/auth/data/dataSourse/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repotitorises_imp.dart';
import 'features/auth/domain/repositories/auth_repostitorise.dart';
import 'features/auth/domain/usecases/login_usescases.dart';
import 'features/auth/domain/usecases/resend_opt_usescases.dart';
import 'features/auth/domain/usecases/verifyopt_usecases.dart';
import 'features/auth/persention/bloc/auth_bloc/auth_bloc.dart';
import 'features/google_map/data/datasourse/google_map_data_source.dart';
import 'features/google_map/data/repostry/google_map_repostiroes.dart';
import 'features/google_map/domain/repostry/google_map_repostirores.dart';
import 'features/google_map/domain/usescases/fetch_details_location.usecases.dart';
import 'features/google_map/domain/usescases/fetch_location.usecases.dart';
import 'features/google_map/domain/usescases/refresh_driver_location.usecases.dart';
import 'features/google_map/presention/logic/google_map_bloc/google_map_bloc.dart';
import 'features/google_map/presention/logic/location_cubit/location_cubit.dart';
import 'features/home/data/datasources/home_local_datasource.dart';
import 'features/home/data/datasources/home_remote_datasources.dart';
import 'features/home/data/repositories/home_repositories_imp.dart';
import 'features/home/domain/repositories/home_repositories.dart';
import 'features/home/domain/usecases/get_all_data_uescases.dart';
import 'features/home/presentation/logic/bloc/home_bloc.dart';
import 'features/notification/data/dataSourse/notification_datasourse.dart';
import 'features/notification/data/repositories/notifcation_repostitorise_imp.dart';
import 'features/notification/domain/repositories/notifcation_repostitorise.dart';
import 'features/notification/domain/usecases/get_notification_usecases.dart';
import 'features/notification/domain/usecases/read_notifcation_usescases.dart';
import 'features/notification/presention/bloc/notitication_bloc/notification_bloc.dart';
import 'features/orders/data/datasources/order_remote_datasource.dart';
import 'features/orders/data/repositories/order_repotitorises_imp.dart';
import 'features/orders/domain/repositories/order_repostitorise.dart';
import 'features/orders/domain/usecases/cancel_order.usecases.dart';
import 'features/orders/domain/usecases/create_order.usecases.dart';
import 'features/orders/domain/usecases/fetch_orders.usecases.dart';
import 'features/orders/domain/usecases/update_order.usecases.dart';
import 'features/orders/presentation/logic/order_bloc/order_bloc.dart';
import 'features/profile/data/dataSourse/profile_data_sourse.dart';
import 'features/profile/data/dataSourse/uplod_image_data_source.dart';
import 'features/profile/data/repositories/profile_repositories_imp.dart';
import 'features/profile/domain/repositories/profile_repositories.dart';
import 'features/profile/domain/usecases/change_code_vehicle.usecases.dart';
import 'features/profile/domain/usecases/logout_usecases.dart';
import 'features/profile/domain/usecases/update_user_profile.usecases.dart';
import 'features/profile/domain/usecases/upload_image_cloudflare_usecases.dart';
import 'features/profile/presention/bloc/code_vehicle/code_vehicle_cubit.dart';
import 'features/profile/presention/bloc/profile_bloc/profile_bloc.dart';
import 'features/profile/presention/bloc/userprofile_bloc/user_profile_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! features - posts

  //? Bloc
  sl.registerFactory(() => AuthBloc(
        loginUseCases: sl(),
        verigyOtpUseCases: sl(),
        resendOptUseCases: sl(),
      ));

  //Order
  sl.registerFactory(() => OrderBloc(
        fetchOrders: sl(),
        createOrder: sl(),
        updateOrder: sl(),
        cancelOrder: sl(),
      ));

  //home
  sl.registerFactory(() => HomeBloc(fetchAllData: sl()));
  sl.registerFactory(() =>
      GoogleMapBloc(refreshDriverLocation: sl(), fetchWashLocation: sl()));

  sl.registerFactory(() => LocationCubit(fetchDetailsLocationUsecases: sl()));

  sl.registerFactory(() =>
      ProfileBloc(uploadImageCloudflare: sl(), logoutDriverUseCases: sl()));
  sl.registerFactory(() => CodeVehicleCubit(changeCodeVehicleUsecases: sl()));

  sl.registerFactory(() => UserProfileBloc(updateUserProfile: sl()));

  sl.registerFactory(() => NotificationBloc(
        readNotification: sl(),
        getNotification: sl(),
      ));

  //=============================

  //? UseCase
  //Auth
  sl.registerLazySingleton(() => LoginUseCases(sl()));
  sl.registerLazySingleton(() => ResendOptUseCases(sl()));
  sl.registerLazySingleton(() => VerigyOtpUseCases(sl()));

  //order
  sl.registerLazySingleton(() => FetchOrdersUsecases(sl()));
  sl.registerLazySingleton(() => CreateOrderUsecases(sl()));
  sl.registerLazySingleton(() => UpdateOrderUsecases(sl()));
  sl.registerLazySingleton(() => CancelOrderUsecases(sl()));

  //Google Map
  sl.registerLazySingleton(() => FetchWashLocationUsecases(sl()));
  sl.registerLazySingleton(() => RefreshDriverLocationUsecases(sl()));
  sl.registerLazySingleton(() => FetchDetailsLocationUsecases(sl()));

  //Profile

  sl.registerLazySingleton(() => UpdateUserProfileUsecases(sl()));
  sl.registerLazySingleton(() => UploadImageWithCloudflareUseCases(sl()));
  sl.registerLazySingleton(() => LogoutDriverUseCases(sl()));

  sl.registerLazySingleton(() => ChangeCodeVehicleUsecases(sl()));

  //notification
  sl.registerLazySingleton(() => GetNotificationUseCases(sl()));
  sl.registerLazySingleton(() => ReadNotificationUseCases(sl()));

  //setting
  sl.registerLazySingleton(() => FetchAllDataUseCases(sl()));

  //===========================================================

  //? Repository
  sl.registerLazySingleton<AuthRepostitory>(() => AuthRepostitoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<OrderRepostitory>(() => OrderRepostitoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<GoogleMapRepostitory>(() => GoogleMapRepostitoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<ProfileRepostitory>(() => ProfileRepostitoryImpl(
      profileRemoteDataSource: sl(),
      networkInfo: sl(),
      uploadImageCloudinartDataSource: sl()));
  sl.registerLazySingleton<NotifcationRepostitory>(() =>
      NotifcationRepostitoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<HomeRepostitory>(() => HomeRepostitoryImp(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
  //=============================

  //? Datasources
  sl.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteImplWithHttp(client: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteImplWithHttp(client: sl()));
  sl.registerLazySingleton<GoogleMapDataSource>(
      () => GoogleMapDataSourceImplWithHttp(client: sl()));
  sl.registerLazySingleton<UploadImageCloudinartDataSource>(
      () => UploadImageCloudinartDataSourceImpCloudinary(client: sl()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteImplWithHttp(client: sl()));
  sl.registerLazySingleton<NotifactionDataRemoteDataSource>(
      () => NotifactionDataRemoteDataSourceHttp(client: sl()));

  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImplWithHttp(client: sl()));

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
  sl.registerLazySingleton(() => InternetConnection());
}
