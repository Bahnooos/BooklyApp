import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/custom_best_seller_list_view_item.dart';

class CustomSearchListView extends StatelessWidget {
  const CustomSearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CustomBestSellerListViewItem(),
          );
        });
  }
}
