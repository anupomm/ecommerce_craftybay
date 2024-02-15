import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainBottomNavController extends GetxController{
  int currentSelectedIndex = 0;

  void changeScreen(int index){
    currentSelectedIndex = index;
    update();
  }

  void backToHome(){
    changeScreen(0);
  }

}