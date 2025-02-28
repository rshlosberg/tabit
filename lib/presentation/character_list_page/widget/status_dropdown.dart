import 'package:flutter/material.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_bloc.dart';

class StatusDropdown extends StatefulWidget {
  final CharacterListPageBloc characterListPageBloc;

  const StatusDropdown({
    super.key,
    required this.characterListPageBloc,
  });

  @override
  State<StatusDropdown> createState() => _StatusDropdownState();
}

class _StatusDropdownState extends State<StatusDropdown> {
  StatusType? _selectedStatus; // Null means "All"

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<StatusType?>(
      value: _selectedStatus,
      hint: const Text("Select Status"),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      ),
      items: [
        const DropdownMenuItem<StatusType?>(
          value: null, // Represents "All"
          child: Text("All"),
        ),
        ...StatusType.values.map((status) {
          return DropdownMenuItem<StatusType>(
            value: status,
            child: Text(status.name),
          );
        }),
      ],
      onChanged: (newStatus) {
        setState(() {
          _selectedStatus = newStatus; // Allow null for "All"
        });
        widget.characterListPageBloc
            .onStatusTypeChanged(newStatusType: newStatus);
      },
    );
  }
}
