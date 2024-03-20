import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_details.dart';
import 'package:ecommerce/data/models/product_details_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../ui/utility/urls.dart';
class ProductDetailsController extends GetxController{
  bool _getProductDetailsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  String _errorMessage = '';
  
  Future<bool> getProductDetails(int id) async {
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductDetails(id));
    _getProductDetailsInProgress = false;
    if(response.isSuccess){
      _productDetails = ProductDetailsModel.fromJson(response.responseJson ?? {}).data!.first;
      update();
      return true;
    }
    else{
      _errorMessage = 'Fetch product details has been failed! Try again!';
      update();
      return false;
    }
  }
}