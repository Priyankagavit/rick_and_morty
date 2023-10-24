import 'package:flutter/material.dart';
import 'gender.dart';
import 'species.dart';
import 'status.dart';

class Filter extends StatelessWidget {
  final int pageNumber;
  final Function(int) updatePageNumber;
  final Function(String) updateStatus;
  final Function(String) updateGender;
  final Function(String) updateSpecies;

  const Filter({
    super.key,
    required this.pageNumber,
    required this.updatePageNumber,
    required this.updateStatus,
    required this.updateGender,
    required this.updateSpecies,
  });

  void clear() {
    updateStatus("");
    updateGender("");
    updateSpecies("");
    updatePageNumber(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: clear,
          child: const Text(
            'Clear Filters',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Status(
                updatePageNumber: updatePageNumber,
                updateStatus: updateStatus,
              ),
              Species(
                updatePageNumber: updatePageNumber,
                updateSpecies: updateSpecies,
              ),
              Gender(
                updatePageNumber: updatePageNumber,
                updateGender: updateGender,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
