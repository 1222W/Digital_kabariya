import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ProductImageContainer extends StatelessWidget {
  void Function()? onTap;
   ProductImageContainer({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        dashPattern: [5],
        color: Colors.black,
        strokeWidth: 1,
        borderType: BorderType.Circle,
        child: const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.camera_alt,
            size: 30,
          ),
        ),
      ),
    );
  }
}

