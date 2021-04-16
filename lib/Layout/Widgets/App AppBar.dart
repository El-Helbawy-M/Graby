import 'package:flutter/material.dart';

PreferredSizeWidget appBar = AppBar(
  toolbarHeight: 70,
  backgroundColor: Colors.white,
  title: Container(
    width: 150,
    height: 50,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('final.png'),
      ),
    ),
  ),
  centerTitle: true,
);
