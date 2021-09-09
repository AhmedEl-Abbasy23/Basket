import 'package:flutter/material.dart';

Widget myDivider() => const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(color: Colors.grey),
    );

Widget buildEmpty({required IconData icon, required String text}) => SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey, size: 50.0),
          Text(
            text,
            style: const TextStyle(color: Colors.grey, fontSize: 18.0),
          ),
        ],
      ),
    );
