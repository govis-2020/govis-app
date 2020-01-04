export "package:govis/base/base_ink.dart";
export "package:govis/base/base_button.dart";
export "package:govis/base/base_divider.dart";
export "package:govis/base/base_card.dart";

export 'loading_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:logger/logger.dart';
import 'package:timeago/timeago.dart' as timeago;

var log = Logger();

showError(String text, BuildContext context, {String title}) {
  Flushbar(
    title: title,
    message: text,
    icon: Icon(Icons.close, color: Colors.white),
    shouldIconPulse: false,
    duration: Duration(milliseconds: 2000),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.red[400],
    borderRadius: 15.0,
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    padding: EdgeInsets.all(20.0),
    animationDuration: Duration(milliseconds: 300),
    onTap: (bar) {
      bar.dismiss(context);
    },
  )..show(context);
}

showSuccess(String text, BuildContext context, {String title}) {
  Flushbar(
    title: title,
    message: text,
    icon: Icon(Icons.check, color: Colors.white),
    shouldIconPulse: false,
    duration: Duration(milliseconds: 2000),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.green[400],
    borderRadius: 15.0,
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    padding: EdgeInsets.all(20.0),
    animationDuration: Duration(milliseconds: 300),
    onTap: (bar) {
      bar.dismiss(context);
    },
  )..show(context);
}

//상대 시간
String fromNow(DateTime date) {
  timeago.setLocaleMessages("ko", timeago.KoMessages());
  return timeago.format(date, locale: "ko");
}
