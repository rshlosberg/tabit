import 'package:flutter/material.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_bloc.dart';

/// Status type dropdown which is above the character list.
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
  // The selected status type. Note that null values mean "All".
  StatusType? _selectedStatus;

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
        // Add the "All" value option to the dropdown list.
        const DropdownMenuItem<StatusType?>(
          /// Default dropdown value, which represents "All".
          value: null,
          child: Text("All"),
        ),
        // Calculate the "real" status types, and add them to the dropdown list.
        ...StatusType.values.map((status) {
          return DropdownMenuItem<StatusType>(
            value: status,
            child: Text(status.name),
          );
        }),
      ],
      onChanged: (newStatus) {
        setState(() {
          // Change the selected value of the dropdown.
          _selectedStatus = newStatus;
        });
        // Send the new status type to the bloc.
        widget.characterListPageBloc
            .onStatusTypeChanged(newStatusType: newStatus);
      },
    );
  }
}
