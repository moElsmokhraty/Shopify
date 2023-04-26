import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: true,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6 / 8.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const SizedBox(
                height: 100,
                width: 100,
              ),
            ),
          ),
        );
      },
    );
  }
}
