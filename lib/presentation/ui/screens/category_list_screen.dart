import 'package:ecommerce/presentation/state_holders/category_controller.dart';
import 'package:ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'All Categories',
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
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategories();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GetBuilder<CategoryController>(builder: (categoryController) {
              if(categoryController.getCategoriesInProgress){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GridView.builder(
                itemCount: categoryController.categoryModel.data?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(
                        child: CategoryCard(
                      categoryData: categoryController.categoryModel.data![index],
                    ));
                  });
            }),
          ),
        ),
      ),
    );
  }
}
