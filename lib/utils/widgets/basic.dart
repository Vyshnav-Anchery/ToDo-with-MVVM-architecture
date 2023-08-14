import 'package:flutter/material.dart';

ElevatedButton normalbtn(Function onPressed, data) {
  return ElevatedButton(
    onPressed: onPressed(),
    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
    child: Text(data),
  );
}
