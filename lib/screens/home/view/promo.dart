import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:otakoyi/models/models.dart';
import 'package:otakoyi/repositories/repository.dart';
import 'package:otakoyi/screens/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({Key key}) : super(key: key);

  @override
  _PromoSliderState createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    // ignore: close_sinks
    final provider = context.watch<HomeBloc>();

    final List<Widget> promoSliders =
        promoList.map((promo) => _PromoImage(promo: promo)).toList();

    return Container(
      height: height * 0.4,
      child: Stack(
        children: [
          CarouselSlider(
            items: promoSliders,
            options: CarouselOptions(
              height: height * 0.37,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 4),
              enlargeCenterPage: false,
              viewportFraction: 0.93,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) => provider.add(
                NextImageEvent(index: index),
              ),
            ),
            carouselController: _controller,
          ),
          Positioned(
            bottom: 60.0,
            left: 50.0,
            child: _DottedIndicator(promoList: promoList),
          ),
          Positioned(
            bottom: 0.0,
            right: 25.0,
            child: _NextButton(controller: _controller),
          )
        ],
      ),
    );
  }
}

class _PromoImage extends StatelessWidget {
  final Promo promo;

  const _PromoImage({Key key, this.promo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            child: Image.asset(promo.image,
                fit: BoxFit.cover, width: 1000.0, height: 1000.0),
          ),
        ),
        Positioned(
          bottom: 80.0,
          left: 30.0,
          child: _PromoImageInfo(promo: promo),
        )
      ],
    );
  }
}

class _PromoImageInfo extends StatelessWidget {
  final Promo promo;

  const _PromoImageInfo({Key key, this.promo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          promo.date,
          style: TextStyle(
              color: Color.fromRGBO(200, 204, 216, 1),
              letterSpacing: 1.0,
              fontSize: 11.0),
        ),
        SizedBox(height: 10.0),
        Text(
          promo.discount,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              fontSize: 33.0),
        ),
        SizedBox(height: 4.0),
        Text(
          promo.category,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              fontSize: 17.0),
        ),
      ],
    );
  }
}

class _DottedIndicator extends StatelessWidget {
  final List promoList;

  const _DottedIndicator({Key key, this.promoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final provider = context.watch<HomeBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: promoList.map((url) {
        int index = promoList.indexOf(url);
        return Container(
          width: provider.currentPromo == index ? 9.0 : 4.5,
          height: provider.currentPromo == index ? 9.0 : 4.5,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: provider.currentPromo == index
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
