import 'package:flutter/material.dart';

class FilterBTN extends StatefulWidget {
  final String input;
  final Function(String) task;
  final Function(int) updatePageNumber;
  final int index;
  final String name;

  const FilterBTN({
    super.key,
    required this.input,
    required this.task,
    required this.updatePageNumber,
    required this.index,
    required this.name,
  });

  @override
  FilterBTNState createState() => FilterBTNState();
}

class FilterBTNState extends State<FilterBTN> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Ink(
          color: clicked ? Colors.green : Colors.blue,
          child: ListTile(
            title: Text(
              widget.input,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              setState(() {
                clicked = !clicked; // Toggle the state when clicked
              });
              widget.task(widget.input);
              widget.updatePageNumber(1);
            },
          ),
        ),
      ],
    );
  }
}
