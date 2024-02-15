import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 320.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:  BoxDecoration(color: Colors.grey.shade300),
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        Positioned(
          bottom:10,
          left:0, right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectedSlider,
              builder: (context, value, _) {
                List<Widget> list = [];
                for (int i = 0; i < 5; i++) {
                  list.add(Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: value == i ? AppColors.primaryColor : Colors.white,
                    ),
                  ));
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list,
                );
              }),
        ),
      ],
    );
  }
}

