import 'package:flutter/material.dart';

class CarouselSliderInfos extends StatefulWidget {
  const CarouselSliderInfos(
      {super.key, required this.itemCount, required this.indexSelectedItem});
  final int itemCount;
  final int indexSelectedItem;

  @override
  State<CarouselSliderInfos> createState() => _CarouselSliderInfosState();
}

class _CarouselSliderInfosState extends State<CarouselSliderInfos> {
  final selectedGradient = [Colors.grey, Colors.grey.shade100];
  final unselectedGradient = [Colors.grey.shade400, Colors.grey.shade100];

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     itemCount: widget.itemCount,
    //     itemBuilder: (_, index) {
    //       final bool isSelected = widget.indexSelectedItem == index;

    //       return AnimatedContainer(
    //         duration: Duration(milliseconds: 100),
    //         decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //             color: isSelected ? Colors.grey : Colors.grey.shade300),
    //         width: isSelected ? 20 : 10,
    //         height: isSelected ? 20 : 10,
    //       );
    //     });

    List<Widget> dots = Iterable.generate(widget.itemCount, (index) {
      final bool isSelected = widget.indexSelectedItem == index;
      return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          // gradient: RadialGradient(
          //   radius: 0.9,
          //     colors: isSelected ? selectedGradient : unselectedGradient),
        ),
        width: isSelected ? 20 : 10,
        height: isSelected ? 20 : 10,
      );
    }).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: dots.toList(),
    );
  }
}
