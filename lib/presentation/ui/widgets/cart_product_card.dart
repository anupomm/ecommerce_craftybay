import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import 'custom_stepper.dart';
class CardProductCard extends StatelessWidget {
  const CardProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/premium-vector/illustration-blue-sneaker_9620-300.jpg?w=740'
                    )
                )
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text('Bata New Shoe', style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),),
                          const SizedBox(height: 8,),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  children: [
                                    TextSpan(text: 'Color : Black'),
                                    TextSpan(text: 'Size : XL'),
                                  ]))
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('\$100', style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,

                    ),),
                    CustomStepper(lowerLimit: 1, upperLimit: 10, stepValue: 1, value: 1, onChange: (newValue){

                    })
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}