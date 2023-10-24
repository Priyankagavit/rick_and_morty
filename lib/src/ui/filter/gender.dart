import 'package:flutter/material.dart';
import 'filter_btn.dart';

class Gender extends StatelessWidget {
  final Function(String) updateGender;
  final Function(int) updatePageNumber;

  const Gender(
      {super.key, required this.updateGender, required this.updatePageNumber});

  @override
  Widget build(BuildContext context) {
    List<String> genders = ["female", "male", "genderless", "unknown"];

    return Column(
      children: <Widget>[
        Card(
          child: ExpansionTile(
            title: const Text("Gender"),
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: genders
                      .asMap()
                      .entries
                      .map(
                        (entry) => FilterBTN(
                          name: "gender",
                          index: entry.key,
                          updatePageNumber: updatePageNumber,
                          task: updateGender,
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
