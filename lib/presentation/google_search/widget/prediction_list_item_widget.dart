import 'package:flutter/material.dart';
import 'package:apiClient/main.dart';
import 'package:stadtplan/presentation/widgets/app_card.dart';
import 'package:stadtplan/themes/assets.dart';
import 'package:stadtplan/themes/constants/palette.dart';
import 'package:stadtplan/themes/constants/spacings.dart';
import 'package:stadtplan/themes/text_styles.dart';

class PredictionListItemWidget extends StatelessWidget {
  const PredictionListItemWidget({
    super.key,
    required this.text,
    required this.predictionsDataModel,
  });

  final String? text;

  final PredictionsDataModel predictionsDataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacings.small),
      child: AppCardWidget(
        backgroundColor: Palette.grey10,
        minHeight: 70,
        cornerRadius: Spacings.mini,
        child: Row(
          children: <Widget>[
            const SizedBox(width: Spacings.medium),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.appCardColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(Spacings.small),
                child: ImageAssets.icMarkerSmall(color: Palette.greyDark),
              ),
            ),
            const SizedBox(width: Spacings.medium),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Spacings.medium),
                child: RichText(
                  text: TextSpan(
                    children: highlightOccurrences(
                      predictionsDataModel.description,
                      text ?? '',
                      TextStyles.paragraphRegular()
                          .copyWith(color: Palette.grey50),
                    ),
                    style: TextStyles.paragraphRegular(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: Spacings.small),
          ],
        ),
      ),
    );
  }

  List<TextSpan> highlightOccurrences(
    String source,
    String query,
    TextStyle style,
  ) {
    if (query.isEmpty || query.length < 2) {
      return <TextSpan>[TextSpan(text: source)];
    }

    final List<Match> matches = <Match>[];
    for (final String token in query.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }

    if (matches.isEmpty) {
      return <TextSpan>[TextSpan(text: source)];
    }
    matches.sort((Match a, Match b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;
    final List<TextSpan> children = <TextSpan>[];
    for (final Match match in matches) {
      if (match.end <= lastMatchEnd) {
      } else if (match.start <= lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.end),
            style: style,
          ),
        );
      } else {
        children
          ..add(
            TextSpan(
              text: source.substring(lastMatchEnd, match.start),
            ),
          )
          ..add(
            TextSpan(
              text: source.substring(match.start, match.end),
              style: style,
            ),
          );
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(
        TextSpan(
          text: source.substring(lastMatchEnd, source.length),
        ),
      );
    }

    return children;
  }
}
