import 'package:flutter/material.dart';
import 'filter_btn.dart';

class Status extends StatelessWidget {
  final Function(String) updateStatus;
  final Function(int) updatePageNumber;

  const Status({required this.updateStatus, required this.updatePageNumber});

  @override
  Widget build(BuildContext context) {
    List<String> status = ["Alive", "Dead", "Unknown"];

    return Column(
      children: <Widget>[
        Card(
          child: ExpansionTile(
            initiallyExpanded: true, // Expanded by default
            title: const Text("Status"),
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: status
                      .asMap()
                      .entries
                      .map(
                        (entry) => FilterBTN(
                          name: "status",
                          index: entry.key,
                          updatePageNumber: updatePageNumber,
                          task: updateStatus,
                          input: entry.value,
                          key: Key(entry.key.toString()),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
