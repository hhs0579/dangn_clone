import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              ),
              hintText: '도로명으로 검색',
              border:UnderlineInputBorder(
                borderSide:BorderSide(
                  color: Colors.grey)
                  ),
              focusedBorder: UnderlineInputBorder(
                borderSide:BorderSide(
                  color: Colors.blue)
                  ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 26,minHeight: 26
              ),
              ),
          ),
        ],
      ),
    );
  }
}