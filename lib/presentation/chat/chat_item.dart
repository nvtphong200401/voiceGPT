import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:voicegpt/core/constants.dart';
import 'package:voicegpt/infrastructure/models/message_model.dart';

import '../widgets/animation_text.dart';

class ChatItem extends HookWidget {
  const ChatItem({super.key, required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: message.role == 'user' ? cardColor : scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.role == 'user')
            const Icon(
              Icons.person,
              color: Colors.white,
            ),
          if (message.role == 'assistant')
            Image.asset(
              appLogo,
              width: 20,
              height: 20,
            ),
          const SizedBox(
            width: 10,
          ),
          AnimationText(message: message.content)
          // Expanded(
          //   child: Column(
          //     // crossAxisAlignment: CrossAxisAlignment.start,
          //     // mainAxisAlignment: MainAxisAlignment.start,
          //     children: content(),
          //   ),
          // )
        ],
      ),
    );
  }

  // List<Widget> content() {
  //   final list = <Widget>[];
  //   // List<InlineSpan> textSpan = <InlineSpan>[];
  //   int durationTime = 0;
  //   message.content.splitMapJoin(RegExp('(```)(.|\n)*?(```)'), onMatch: (codeBlock) {
  //     // list.add(Text.rich(TextSpan(children: textSpan)));
  //     // textSpan = <InlineSpan>[];

  //     list.add(HookBuilder(builder: (context) {
  //       final code = message.content.substring(codeBlock.start, codeBlock.end).trim();
  //       final animationController =
  //           useAnimationController(duration: Duration(milliseconds: code.length * 10));
  //       // animationController.reset();
  //       // debugPrint('animation ${animationController.status}');
  //       // if (animationController.isDismissed) {
  //       animationController.forward();
  //       // }
  //       durationTime += code.length * 100;
  //       return FadeTransition(
  //         opacity: animationController,
  //         child: MarkdownWidget(
  //           data: code,
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //         ),
  //       );
  //     }));

  //     return '';
  //   }, onNonMatch: (nonCodeBlock) {
  //     nonCodeBlock.splitMapJoin(RegExp('`(.|\n)*?`'), onMatch: (highlight) {
  //       final highlightText = nonCodeBlock.substring(highlight.start + 1, highlight.end - 1).trim();

  //       list.add(AnimationText(
  //         text: highlightText,
  //         forwardAfter: Duration(milliseconds: durationTime),
  //       ));
  //       durationTime += highlightText.length * 10;
  //       // textSpan.add(TextSpan(
  //       //     text: ' ${nonCodeBlock.substring(highlight.start + 1, highlight.end - 1).trim()} ',
  //       //     style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  //       return '';
  //     }, onNonMatch: (normalText) {
  //       list.add(AnimationText(
  //         text: normalText,
  //         forwardAfter: Duration(milliseconds: durationTime),
  //       ));
  //       durationTime += normalText.length * 10;
  //       // textSpan.add(TextSpan(
  //       //     text: normalText.trim(), style: const TextStyle(color: Colors.white, fontSize: 16)));
  //       return '';
  //     });
  //     return '';
  //   });
  //   // list.add(Text.rich(TextSpan(children: textSpan)));

  //   return list;
  // }

  // Widget animationContent() {
  //   return AnimationText(text: message.content);
  //   // return Text(message.content);
  // }
}
