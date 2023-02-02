import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void printMessage(String message){
  if(kDebugMode){
    log(message);
  }
}
