import 'package:dangn/constants/keys.dart';
import 'package:dangn/utils/logger.dart';
import 'package:dio/dio.dart';

class AddressService {
  void searchAddressBystr(String text) async {
    final formdata = {
      'key': VWORLD_KEY,
      'request': 'search',
      'query': 'text',
      'size': 30,
      'type': 'ADDRESS',
      'category': 'ROAD',
    };
    final response = await Dio()
        .get('http://api.vworld.kr/req/search?', queryParameters: formdata)
        .catchError((e) {
      logger.e(e.message);
    });
    logger.d(response);
  }
}
