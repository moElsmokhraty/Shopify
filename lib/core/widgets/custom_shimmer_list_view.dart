import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerList extends StatelessWidget {
  const CustomShimmerList({Key? key, required this.itemCount})
      : super(key: key);
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[400]!,
        child: Row(
          children: [
            Container(
              color: Colors.grey,
              height: 80,
              width: 80,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 20,
                color: Colors.grey[100],
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: itemCount,
    );
  }
}
