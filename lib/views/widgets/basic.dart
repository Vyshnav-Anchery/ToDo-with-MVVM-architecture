import 'package:flutter/material.dart';

ElevatedButton normalbtn(Function onPressed, data) {
  return ElevatedButton(
    onPressed: onPressed(),
    child: Text(data),
    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
  );
}
