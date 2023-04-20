import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomProductImages extends StatefulWidget {
  const CustomProductImages({Key? key, required this.images}) : super(key: key);

  final List<dynamic> images;

  @override
  State<CustomProductImages> createState() => _CustomProductImagesState();
}

class _CustomProductImagesState extends State<CustomProductImages> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: size.height * 0.5,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              onPageChanged: (ind, reason) {
                setState(() {
                  index = ind;
                });
              },
            ),
            items: [
              CachedNetworkImage(
                width: double.infinity,
                imageUrl: widget.images[0]!,
              ),
              SizedBox(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: widget.images[1]!,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSmoothIndicator(
              activeIndex: index,
              count: 2,
              effect: const ExpandingDotsEffect(
                dotHeight: 5,
                dotWidth: 5,
                radius: 1.6,
                expansionFactor: 4,
                spacing: 8,
                dotColor: Colors.grey,
                activeDotColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
