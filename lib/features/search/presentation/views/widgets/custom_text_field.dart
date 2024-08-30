import 'package:flutter/material.dart';


import 'build_floating_search_bar.dart';


class CustomTextField extends StatelessWidget {
 const CustomTextField({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand, children: [BuildFloatingSearchBar()]);
  }

 

 
}
