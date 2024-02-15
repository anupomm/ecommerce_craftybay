import 'package:ecommerce/presentation/ui/screens/category_list_screen.dart';
import 'package:ecommerce/presentation/ui/screens/product_list_screen.dart';
import 'package:ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/category_card.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/home/home_slider.dart';
import '../widgets/home/section_header.dart';
import '../widgets/product_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.craftyBayNavLogoSVG),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.call,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.notifications_none,
              onTap: () {},
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeSlider(),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(title: 'All Categories', onTap: () {
                Get.find<MainBottomNavController>().changeScreen(1);
              }),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CategoryCard();
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(title: 'Popular', onTap: () {
                Get.to(const ProductListScreen());
              }),
              SizedBox(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                  return const ProductCard();
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(title: 'Special', onTap: () {}),
              SizedBox(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const ProductCard();
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(title: 'New', onTap: () {}),
              SizedBox(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const ProductCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}


