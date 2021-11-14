import 'package:dangn/utils/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceAround ,
        children: [
          Text('당근 마켓',
          style: TextStyle(fontSize:30,color:Theme.of(context).colorScheme.primary,fontWeight:FontWeight.w600)//
          ),
          ExtendedImage.asset('assets/imgs/carrot_intro.png'),
          Text('우리 동네 중고 직거래 당근마켓',
          style: TextStyle(fontSize:22,fontWeight:FontWeight.w700)),
          Text(' 당근마켓은 동네 직거래 마켓이에요.\n  내 동네를 설정하고 시작해보세요!',
          style: TextStyle(fontSize:16,fontWeight:FontWeight.w500)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                  onPressed: () {
                    logger.d('on text button click');
                  },
                  child: Text(
                    '내 동네 설정하고 시작하기',
                    style:TextStyle(color: Colors.white),
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
  }
}