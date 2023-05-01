import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/widget/markdown.dart';

import '../../application/shared/providers.dart';
import '../../service/shared/providers.dart';

class AnimationText extends HookConsumerWidget {
  const AnimationText(
      {super.key,
      required this.message,
      this.forwardAfter = const Duration(microseconds: 0)});
  final String message;
  final Duration forwardAfter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();
    final shouldAnimate = ref
        .watch(chatNotifierProvider)
        .state
        .when(loading: (_) => false, data: (data) => true);

    final animationController = useAnimationController(
        duration: Duration(milliseconds: message.length * 10), keys: [message]);
    useEffect(() {
      final scrollController = ref.read(scrollProvider);
      if (shouldAnimate) {
        onTypingResult() {
          // if (scrollController.position == scrollController.offset) {
          scrollController.animateTo(scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
          // }
        }

        animationController.forward();
        animationController.addListener(onTypingResult);

        return () {
          animationController.removeListener(onTypingResult);
          // animationController.dispose();
        };
      } else {
        animationController.animateTo(1);
      }
      return null;
    }, [animationController]);

    final typingText = CurveTween(
      curve: Curves.linear,
    ).animate(animationController);

    return Expanded(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          final count = (typingText.value.clamp(0, 1) * message.length).round();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: content(shouldAnimate
                ? message.characters.take(count).toString()
                : message),
          );
        },
      ),
    );
  }

  List<Widget> content(String text) {
    final list = <Widget>[];
    List<InlineSpan> textSpan = <InlineSpan>[];
    text.splitMapJoin(RegExp('(```)(.|\n)*?(```)'), onMatch: (codeBlock) {
      list.add(Text.rich(TextSpan(children: textSpan)));
      textSpan = <InlineSpan>[];

      list.add(HookBuilder(builder: (context) {
        final code = text.substring(codeBlock.start, codeBlock.end).trim();
        return MarkdownWidget(
          data: code,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      }));

      return '';
    }, onNonMatch: (nonCodeBlock) {
      nonCodeBlock.splitMapJoin(RegExp('`(.|\n)*?`'), onMatch: (highlight) {
        final highlightText = nonCodeBlock
            .substring(highlight.start + 1, highlight.end - 1)
            .trim();
        textSpan.add(TextSpan(
            text: ' $highlightText ',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)));
        return '';
      }, onNonMatch: (normalText) {
        textSpan.add(TextSpan(
            text: normalText.trim(),
            style: const TextStyle(color: Colors.white, fontSize: 16)));
        return '';
      });
      return '';
    });
    list.add(Text.rich(TextSpan(children: textSpan)));

    return list;
  }
}
