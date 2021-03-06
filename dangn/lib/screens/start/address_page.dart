import 'package:dangn/data/address_model.dart';
import 'package:dangn/screens/start/address_service.dart';
import 'package:dangn/utils/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  AddressModel? _addressModel;

  TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            onFieldSubmitted: (text) async {
              _addressModel = await AddressService().searchAddressByStr(text);
              setState(() {});
            },
            controller: _addressController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: '도로명으로 검색',
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              prefixIconConstraints:
                  BoxConstraints(minWidth: 26, minHeight: 26),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.compass,
              color: Colors.white,
              size: 20,
            ),
            label: Text(
              '현재 위치 찾기',
              style: Theme.of(context).textTheme.button,
            ),
          ),
          if (_addressModel != null)
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) {
                  logger.d('index:$index');
                  if (_addressModel == null ||
                      _addressModel!.result == null ||
                      _addressModel!.result!.items == null ||
                      _addressModel!.result!.items![index].address == null)
                    return Container();
                  return ListTile(
                    onTap: () {
                      _saveAddressOnSharedPreference(
                          _addressModel!.result!.items![index].address!.road ??
                              "");
                        context.read<PageController>().animateToPage(2,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                    },
                    title: Text(
                        _addressModel!.result!.items![index].address!.road ??
                            ""),
                    subtitle: Text(
                        _addressModel!.result!.items![index].address!.parcel ??
                            ""),
                  );
                },
                itemCount: (_addressModel == null ||
                        _addressModel!.result == null ||
                        _addressModel!.result!.items == null)
                    ? 0
                    : _addressModel!.result!.items!.length,
              ),
            )
        ],
      ),
    );
  }



  _saveAddressOnSharedPreference(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', address);
  }
}
