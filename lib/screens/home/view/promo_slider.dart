import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:otakoyi/repositories/repository.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({Key key}) : super(key: key);

  @override
  _PromoSliderState createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    final List<Widget> imageSliders = promoList
        .map((item) => _PromoImage(
            item: item.image,
            promoDate: item.date,
            promoPercent: item.discount,
            promoCategory: item.category))
        .toList();

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              height: height * 0.37,
              autoPlay: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 6),
              enlargeCenterPage: false,
              viewportFraction: 0.93,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          carouselController: _controller,
        ),
        Positioned(
          bottom: 60.0,
          left: 50.0,
          child: _DottedIndicator(imagesList: promoList, current: _current),
        ),
        Positioned(
          bottom: 0.0,
          right: 25.0,
          child: _NextButton(controller: _controller),
        )
      ],
    );
  }
}

class _PromoImage extends StatelessWidget {
  final String item, promoDate, promoPercent, promoCategory;

  const _PromoImage(
      {Key key,
      this.item,
      this.promoDate,
      this.promoPercent,
      this.promoCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item,
                      fit: BoxFit.cover, width: 1000.0, height: 1000.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 80.0,
          left: 30.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                promoDate,
                style: TextStyle(
                    color: Color.fromRGBO(200, 204, 216, 1),
                    letterSpacing: 1.0,
                    fontSize: 11.0),
              ),
              SizedBox(height: 10.0),
              Text(
                promoPercent,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontSize: 33.0),
              ),
              SizedBox(height: 4.0),
              Text(
                promoCategory,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontSize: 17.0),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _DottedIndicator extends StatelessWidget {
  final List imagesList;
  final int current;
  const _DottedIndicator({Key key, this.imagesList, this.current})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagesList.map((url) {
        int index = imagesList.indexOf(url);
        return Container(
          width: current == index ? 9.0 : 4.5,
          height: current == index ? 9.0 : 4.5,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: current == index
                ? Color.fromRGBO(199, 175, 103, 1)
                : Color.fromRGBO(200, 204, 216, 1),
          ),
        );
      }).toList(),
    );
  }
}

class _NextButton extends StatelessWidget {
  final CarouselController controller;
  const _NextButton({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => controller.nextPage(),
      elevation: 7.0,
      fillColor: Colors.white,
      child: Icon(
        Icons.navigate_next,
        size: 35.0,
      ),
      padding: EdgeInsets.all(14.0),
      shape: CircleBorder(),
    );
  }
}
