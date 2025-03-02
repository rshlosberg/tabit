import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_state.dart';

/// The core data of the details page.
class CoreData extends StatelessWidget {
  /// The character details view data.
  final CharacterDetailsView characterDetailsView;

  const CoreData({
    super.key,
    required this.characterDetailsView,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // The character species.
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              "Species: ${characterDetailsView.species}",
              style: Theme.of(context).textTheme.titleLarge,
              minFontSize: 1,
            ),
          ),
          // The character status type.
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              "Status: ${characterDetailsView.status.name}",
              style: Theme.of(context).textTheme.titleLarge,
              minFontSize: 1,
            ),
          ),
          // The character gender type.
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              "Gender: ${characterDetailsView.gender.name}",
              style: Theme.of(context).textTheme.titleLarge,
              minFontSize: 1,
            ),
          ),
          // The character origin - name and url.
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: AutoSizeText(
                "Origin:\nName: ${characterDetailsView.origin.name}\nUrl: ${characterDetailsView.origin.url}",
                style: Theme.of(context).textTheme.titleLarge,
                minFontSize: 1,
              ),
            ),
          ),
          // The character location - name and url.
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: AutoSizeText(
                "Location:\nName: ${characterDetailsView.location.name}\nUrl: ${characterDetailsView.location.url}",
                style: Theme.of(context).textTheme.titleLarge,
                minFontSize: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
