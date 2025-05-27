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
import 'features/auth/domain/usecases/login_usescases.dart';
import 'features/auth/domain/usecases/resend_opt_usescases.dart';
import 'features/auth/domain/usecases/verifyopt_usecases.dart';
import 'features/auth/persention/bloc/auth_bloc/auth_bloc.dart';
import 'features/home/data/datasources/home_local_datasource.dart';
import 'features/home/data/datasources/home_remote_datasources.dart';
import 'features/home/data/repositories/home_repositories_imp.dart';
import 'features/home/domain/repositories/home_repositories.dart';
import 'features/home/domain/usecases/get_all_data_uescases.dart';
import 'features/home/presentation/logic/bloc/home_bloc.dart';
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

  //home
  sl.registerFactory(() => HomeBloc(fetchAllData: sl()));

  sl.registerFactory(() =>
      ProfileBloc(uploadImageCloudflare: sl(), logoutDriverUseCases: sl()));
  sl.registerFactory(() => CodeVehicleCubit(changeCodeVehicleUsecases: sl()));

  sl.registerFactory(() => UserProfileBloc(updateUserProfile: sl()));

  //=============================

  //? UseCase
  //Auth
  sl.registerLazySingleton(() => LoginUseCases(sl()));
  sl.registerLazySingleton(() => ResendOptUseCases(sl()));
  sl.registerLazySingleton(() => VerigyOtpUseCases(sl()));

  //Profile

  sl.registerLazySingleton(() => UpdateUserProfileUsecases(sl()));
  sl.registerLazySingleton(() => UploadImageWithCloudflareUseCases(sl()));
  sl.registerLazySingleton(() => LogoutDriverUseCases(sl()));

  sl.registerLazySingleton(() => ChangeCodeVehicleUsecases(sl()));

  //setting
  sl.registerLazySingleton(() => FetchAllDataUseCases(sl()));

  //===========================================================

  //? Repository
  sl.registerLazySingleton<AuthRepostitory>(() => AuthRepostitoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<ProfileRepostitory>(() => ProfileRepostitoryImpl(
      profileRemoteDataSource: sl(),
      networkInfo: sl(),
      uploadImageCloudinartDataSource: sl()));

  sl.registerLazySingleton<HomeRepostitory>(() => HomeRepostitoryImp(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));
  //=============================

  //? Datasources

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteImplWithDio(apiService: sl()));

  sl.registerLazySingleton<UploadImageCloudinartDataSource>(
      () => UploadImageCloudinartDataSourceImpCloudinary(client: sl()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteImpWithDio(client: sl()));

  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImplWithDio(apiService: sl()));

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
