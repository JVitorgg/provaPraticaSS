import 'package:flutter/material.dart';

class GenresTags extends StatelessWidget {
  final String label;
  final bool selected;

  const GenresTags({
    super.key,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth * 0.01, screenHeight * 0.01,
          screenWidth * 0.01, screenHeight * 0.01),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
        selected: selected,
        shape: selected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
        showCheckmark: false,
        onSelected: (bool selected) {},
      ),
    );
  }
}
