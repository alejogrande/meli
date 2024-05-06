import 'package:challenge_meli/data/datasource/remote_datasource.dart';
import 'package:challenge_meli/data/model/app_config_model.dart';
import 'package:challenge_meli/data/respositories/meli_repository_impl.dart';
import 'package:challenge_meli/domain/entities/app_config_entity.dart';
import 'package:challenge_meli/domain/respositories/meli_repository.dart';
import 'package:challenge_meli/ui/pages/home/bloc/home_bloc.dart';
import 'package:challenge_meli/ui/pages/product_detail/bloc/product_detail_bloc.dart';
import 'package:challenge_meli/ui/pages/search_list/bloc/search_list_bloc.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:yaml/yaml.dart';

final locator = GetIt.instance;

Future<void> init() async {
  final configFile = await rootBundle.loadString('lib/config/app_config.yaml');
  final YamlMap yamlMap = loadYaml(configFile);
  late AppConfig appConfig = AppConfigModel.fromMap(yamlMap);
  // bloc

  locator.registerFactory(() => HomeBloc());
  locator.registerFactory(() => SearchListBloc());
  locator.registerFactory(() => ProductDetailBloc());

  // cubit


  // usecase
  // locator.registerLazySingleton(() => GetMeliApi(locator()));

  // repository
  locator.registerLazySingleton<MeliRepository>(
    () => MeliRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(
        baseUrl: appConfig.baseUrl,
        connectTimeout: appConfig.connectTimeOut,
        receiveTimeOut: appConfig.receiveTimeOut,
        hash: appConfig.hash,
        ts: appConfig.ts,
        apiKey: appConfig.apiKey
      ));

  // external
  locator.registerLazySingleton(() => http.Client());
}
