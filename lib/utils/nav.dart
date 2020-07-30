
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {replace = false}) {
  if(replace) {
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  } else {
    return Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }
}

pop<T extends Object>(BuildContext context, [ T result ]) {
  return Navigator.pop(context);
}