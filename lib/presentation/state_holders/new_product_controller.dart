import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../ui/utility/urls.dart';

// SRP - Single Responsibility Principle
class NewProductController extends GetxController {
  bool _getNewProductsInProgress = false;
  ProductModel _newProductModel = ProductModel();
  String _errorMessage = '';

  bool get getNewProductsInProgress => _getNewProductsInProgress;

  ProductModel get newProductModel => _newProductModel;

  Future<bool> getNewProducts() async {
    _getNewProductsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.getProductsByRemarks('new'),
    );
    _getNewProductsInProgress = false;
    if (response.isSuccess) {
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'New product fetch failed! Try again.';
      update();
      return true;
    }
  }

}
