import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


mixin Mensagem {
  void showMensagem(String msg, context, {Toast? duration, ToastGravity? gravity}) {
    Fluttertoast.showToast(msg: msg, toastLength: duration?? Toast.LENGTH_LONG, gravity: gravity ?? ToastGravity.BOTTOM, backgroundColor: Colors.orangeAccent, textColor: Colors.black);
  }
}