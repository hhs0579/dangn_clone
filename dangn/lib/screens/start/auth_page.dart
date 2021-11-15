import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:dangn/constants/common_size.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final inputBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(
            title: Text('전화번호 로그인',
                style: Theme.of(context).appBarTheme.toolbarTextStyle),
          ),
          body: Padding(
            padding: const EdgeInsets.all(common_padding),
            child: Column(
              children: [
                Row(
                  children: [
                    ExtendedImage.asset('assets/imgs/padlock.png',
                        width: size.width * 0.15, height: size.height * 0.15
                        ),
                        SizedBox(
                          width:common_small_padding,
                        ),
                    Text('''    당근마켓은 휴대폰 번호로 가입하세요
    번호는 안전하게 보관되며
    어디에도 공개되지 않아요 ''')
                  ],
                ),
                SizedBox(
                  height: common_padding,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: inputBorder,border: inputBorder
                    ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
