import 'package:dangn/constants/keys.dart';
import 'package:dangn/data/address_model.dart';
import 'package:dangn/utils/logger.dart';
import 'package:dio/dio.dart';

class AddressService {
  void searchAddressByStr(String text) async {
    final formData = {
      'key': VWORLD_KEY,
      'request': 'search',
      'query': text,
      'size': 30,
      'type': 'ADDRESS',
      'category': 'ROAD',
    };
    final response = await Dio()
        .get('http://api.vworld.kr/req/search', queryParameters: formData)
        .catchError((e) {
      logger.e(e.message);
    });
    AddressModel addressModel = AddressModel.fromJson(response.data["result"]);
    logger.d(addressModel);
  }
}
