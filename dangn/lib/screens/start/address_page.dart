import 'package:dangn/screens/start/address_service.dart';
import 'package:dangn/utils/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);
  TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
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
            onPressed: () {
              final text = _addressController.text;
              if(text.isNotEmpty){
                AddressService().searchAddressByStr(text);
              }
            },
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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) {
                logger.d('index:$index');
                return ListTile(
                    leading: Icon(Icons.image),
                    trailing: ExtendedImage.asset('assets/imgs/a.png'),
                    title: Text('address $index'),
                    subtitle: Text('subtitle $index'));
              },
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
