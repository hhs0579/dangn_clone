import 'package:dangn/utils/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  PageController controller;
  IntroPage(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        final imgSize = size.width - 40;
        final sizeOfposImg = imgSize * 0.1;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('당근 마켓',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Theme.of(context).colorScheme.primary) //
                    ),
                SizedBox(
                  width: imgSize,
                  height: imgSize,
                  child: Stack(
                    children: [
                      ExtendedImage.asset('assets/imgs/carrot_intro.png'),
                      Positioned(
                          width: sizeOfposImg,
                          left: imgSize * 0.45,
                          top: imgSize * 0.45,
                          height: sizeOfposImg,
                          child: ExtendedImage.asset(
                              'assets/imgs/carrot_intro_pos.png')),
                    ],
                  ),
                ),
                Text('우리 동네 중고 직거래 당근마켓',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                Text(' 당근마켓은 동네 직거래 마켓이에요.\n  내 동네를 설정하고 시작해보세요!',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.animateToPage(1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                        logger.d('on text button click');
                      },
                      child: Text(
                        '내 동네 설정하고 시작하기',
                        style: Theme.of(context).textTheme.button,
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue[400],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
