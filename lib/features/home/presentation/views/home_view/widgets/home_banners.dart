import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanners extends StatefulWidget {
  const HomeBanners({Key? key}) : super(key: key);

  @override
  State<HomeBanners> createState() => _HomeBannersState();
}

class _HomeBannersState extends State<HomeBanners> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
              aspectRatio: 16 / 9,
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
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  'https://student.valuxapps.com/storage/uploads/banners/1680057346A0jc4.41.PNG',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  'https://student.valuxapps.com/storage/uploads/banners/1680055989g181K.37.PNG',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  'https://student.valuxapps.com/storage/uploads/banners/1680055803aDUjo.36.PNG',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSmoothIndicator(
              activeIndex: index,
              count: 3,
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
