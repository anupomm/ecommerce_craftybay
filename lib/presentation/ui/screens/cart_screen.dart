import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_controller.dart';
import '../utility/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Carts',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Column(
            children: [
              Card(child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 90,
                    color: AppColors.primaryColor,

                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Bata New Shoe'),
                                  RichText(text: const TextSpan(
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    children: [
                                      TextSpan(text: 'Color : Black'),
                                      TextSpan(text: 'Size : XL'),
                                    ]
                                  ))

                                ],
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),)
            ],
          ),),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\$1000',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    width: 120,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Checkout'))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
