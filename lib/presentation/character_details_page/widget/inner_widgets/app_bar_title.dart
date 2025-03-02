import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_state.dart';

/// The app bar title which contains the image and the character name.
class AppBarTitle extends StatelessWidget {
  /// The character details view data.
  final CharacterDetailsView characterDetailsView;

  const AppBarTitle({
    super.key,
    required this.characterDetailsView,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // The character image.
        Hero(
          tag: characterDetailsView.image,
          child: CircleAvatar(
            radius: 75,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(characterDetailsView.image),
          ),
        ),
        const SizedBox(height: 10),
        // The character name.
        SizedBox(
          height: 50,
          child: AutoSizeText(
            "Name: ${characterDetailsView.name}",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            maxLines: 1,
            minFontSize: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
