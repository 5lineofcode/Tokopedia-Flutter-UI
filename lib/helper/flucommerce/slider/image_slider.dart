import 'package:flutter/material.dart';
import 'package:tokopedia_dashboard/helper/flucommerce/slider/dotsindicator.dart';

class ImageSlider extends StatelessWidget {
  final List images;
  final double height;
  ImageSlider({
    @required this.images,
    this.height: 150.0,
  });

  final pageController = PageController();
  static const duration = const Duration(milliseconds: 300);
  static const curve = Curves.ease;
  final arrowColor = Colors.black.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconTheme(
        data: IconThemeData(color: arrowColor),
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              PageView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                controller: pageController,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: OverflowBox(
                      child: Image(
                        image: AssetImage(images[index]["image"]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 5.0,
                    top: 5.0,
                  ),
                  child: DotsIndicator(
                    controller: pageController,
                    itemCount: images.length,
                    onPageSelected: (int page) {
                      pageController.animateToPage(
                        page,
                        duration: duration,
                        curve: curve,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
