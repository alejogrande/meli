import 'package:challenge_meli/data/exception.dart';
import 'package:challenge_meli/data/model/category_model.dart' as category_model;
import 'package:challenge_meli/domain/entities/items_category_entity.dart';
import 'package:dio/dio.dart';


class RemoteDataSource {
  late BaseOptions _optionsApi;
  late Dio _client;

  RemoteDataSource({
    required String baseUrl,
    required int connectTimeout,
    required int receiveTimeOut,
    required int ts,
  }) {
    _optionsApi = BaseOptions(
        baseUrl: baseUrl,
        responseType: ResponseType.json,
        headers: {'Content-Type': 'application/json', 'accept': '*/*'});
    _client = Dio(_optionsApi);
  }

  addInterceptor(Interceptor interceptor) {
    _client.interceptors.add(interceptor);

    _client.interceptors.add(InterceptorsWrapper(onError: (e, handler) {
      // ignore: unnecessary_null_comparison
      if (e == null) {
        handler.reject(e);
      } else {
        handler.resolve(
            e.response ?? Response(requestOptions: RequestOptions(path: '')));
      }
    }, onRequest: (r, handler) {
      handler.next(r);
    }, onResponse: (r, handler) {
      handler.next(r);
    }));
  }

  Future<ItemsCategoryEntity> getItemsCategories(
      {int? offset, String? category,String? name}) async {
    final Map<String, dynamic> queryParams = {
      'offset': offset ?? 0,
      'limit': 10,
    };

    if (category != null && category.isNotEmpty) {
      queryParams['category'] = category;
    }

    if (name != null && name.isNotEmpty) {
      queryParams['q'] = name;
    }

    final apiResponse = await _client
        .get('/search', queryParameters: queryParams)
        .catchError((error) {
      return error.response;
    });
    if (apiResponse.statusCode == 200) {
      return category_model.ItemsCategoryModel.fromJson((apiResponse.data));
    } else {
      throw ServerException();
    }
  }
}
