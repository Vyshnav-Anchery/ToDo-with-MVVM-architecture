import 'package:flutter/material.dart';

ElevatedButton normalbtn(Function action, data) {
  return ElevatedButton(
    onPressed: action(),
    child: Text(data),
    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
  );
}
