import 'package:flutter/material.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_bloc.dart';

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
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
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
    _searchController.dispose();
    super.dispose();
  }
}
