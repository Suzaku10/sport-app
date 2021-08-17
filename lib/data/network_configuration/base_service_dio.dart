import 'network_service_dio.dart';

class BaseServiceDio {
  late NetworkServiceDio service;

  BaseServiceDio({String? uri}) {
    if (uri == null) {
      service = NetworkServiceDio("https://www.thesportsdb.com/api/");
    } else {
      service = NetworkServiceDio("https://www.thesportsdb.com/api/");
    }
  }
}
