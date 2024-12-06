import 'package:flutter/material.dart';

import '../../../core/config/constants.dart';

class AvailableSizeWidget extends StatefulWidget {
  final String size;
  const AvailableSizeWidget({super.key,required this.size});

  @override
  State<AvailableSizeWidget> createState() => _AvailableSizeWidgetState();
}

class _AvailableSizeWidgetState extends State<AvailableSizeWidget> {
  bool is_selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        is_selected = !is_selected;
        setState(() {});
      },
      child: Container(
        height: 40,
        width: 60,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: is_selected?Colors.red:Colors.white,
          border: Border.all(color: Colors.black87),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(widget.size,style: Constants.theme.textTheme.bodySmall?.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
