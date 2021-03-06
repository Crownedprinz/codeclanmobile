import 'package:codeclanmobile/models/register_user_dto.dart';
import 'package:codeclanmobile/repositories/interceptor.dart';
import 'package:codeclanmobile/services/api/i_api_service.dart';
import 'package:codeclanmobile/services/api/models/api_exception.dart';
import 'package:codeclanmobile/services/api/models/login_res_dto.dart';
import 'package:codeclanmobile/utils/globals.dart';
import 'package:dio/dio.dart';

import 'models/register_res_dto.dart';

class ApiService implements IAPIService {
  Dio _dio;

  ApiService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: Globals.apiBaseUrl);
    _dio = Dio(options);
    _dio.interceptors.add(ApiInterceptor());
  }

  @override
  Future<String> login(email, password) async {
    final url = '/auth/login';
    try {
      Response response = await _dio.post(url,
          data: {
            "email": email,
            "password": password,
          },
          options: Options(headers: {"requireToken": false}));
      LoginResDto result = LoginResDto.fromJson(response.data);
      return result.accessToken;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  @override
  Future<bool> register(RegisterUserDto registerUserDto) async {
    final url = '/auth/register';
    try {
      Response response = await _dio.post(url,
          data: registerUserDto.toJson(),
          options: Options(headers: {"requireToken": false}));
      RegisterUserResDto result = RegisterUserResDto.fromJson(response.data);
      return result.canLogin;
    } on DioError catch (e) {
      if (e.response != null) {
        ApiException result = ApiException.fromJson(e.response.data);
        throw result.message;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }
}
