import 'package:get/get_connect.dart';
import 'package:oms/services/networking/api_constants.dart';
import 'package:oms/services/networking/interceptors/request_interceptor.dart';
import 'package:oms/services/networking/interceptors/response_interceptor.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
