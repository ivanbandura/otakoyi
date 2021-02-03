import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otakoyi/screens/home/bloc/home_bloc.dart';
import 'package:otakoyi/screens/home/view/promo_slider.dart';
import 'package:otakoyi/widgets/screen_template.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeBloc();
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ScreenTemplate(
            index: 0,
            body: _Body(),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: height * 0.4, child: PromoSlider()),
          ],
        ),
      ),
    );
  }
}
