import 'package:flutter/material.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_bloc.dart';

/// Search bar widget which is above the character list and status type dropdown.
class SearchBarWidget extends StatefulWidget {
  final CharacterListPageBloc characterListPageBloc;

  const SearchBarWidget({
    super.key,
    required this.characterListPageBloc,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  /// A controller of the text.
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    // Init the search controller.
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: (text) =>
          widget.characterListPageBloc.onSearchTextChanged(newText: text),
      decoration: InputDecoration(
        hintText: "Search characters...",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the search controller.
    _searchController.dispose();
    super.dispose();
  }
}
