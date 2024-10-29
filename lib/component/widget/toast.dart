import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastValidate(String message) {
  Fluttertoast.showToast(
      backgroundColor: Colors.red,
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
  
}
toastValidateSucces(String message) {
    Fluttertoast.showToast(
        backgroundColor: Colors.green,
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }