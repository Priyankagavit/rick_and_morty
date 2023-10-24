import 'package:flutter/material.dart';
import 'filter_btn.dart';

class Species extends StatelessWidget {
  final Function(String) updateSpecies;
  final Function(int) updatePageNumber;

  const Species(
      {super.key, required this.updateSpecies, required this.updatePageNumber});

  @override
  Widget build(BuildContext context) {
    List<String> species = [
      "Human",
      "Alien",
      "Humanoid",
      "Poopybutthole",
      "Mythological",
      "Unknown",
      "Animal",
      "Disease",
      "Robot",
      "Cronenberg",
      "Planet",
    ];

    return Column(
      children: <Widget>[
        Card(
          child: ExpansionTile(
            title: const Text("Species"),
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: species
                      .asMap()
                      .entries
                      .map(
                        (entry) => FilterBTN(
                          name: "species",
                          index: entry.key,
                          updatePageNumber: updatePageNumber,
                          task: updateSpecies,
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
