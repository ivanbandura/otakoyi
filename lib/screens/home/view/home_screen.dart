import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otakoyi/repositories/repository.dart';
import 'package:otakoyi/screens/home/bloc/home_bloc.dart';
import 'package:otakoyi/screens/home/view/new_in.dart';
import 'package:otakoyi/screens/home/view/promo.dart';
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
          // ignore: close_sinks
          final provider = context.watch<HomeBloc>();

          if (state is RefreshState) {
            provider.add(RefreshEvent());
          }
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PromoSlider(),
          NewIn(
            count: '604',
            sex: 'WOMEN\'S',
            backgroundColor: Colors.transparent,
            fontColor: Colors.black,
            products: womenProducts,
          ),
          NewIn(
            count: '192',
            sex: 'MEN\'S',
            backgroundColor: Colors.black,
            fontColor: Colors.white,
            products: menProducts,
          ),
        ],
      ),
    );
  }
}
