import 'package:flutter/material.dart';

import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';

/// A word or expression meaning with no video available for its sign yet.
class MeaningCardBodyWithoutVideoSigns extends StatelessWidget {
  const MeaningCardBodyWithoutVideoSigns({
    super.key,
    required this.fullCard,
    required this.isLastMeaning,
  });
  final FullCard fullCard;
  final bool isLastMeaning;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLastMeaning ? 15 : 0),
      child: Card(
        color: Colors.grey.withValues(alpha: 230),
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                fullCard.card.name,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
