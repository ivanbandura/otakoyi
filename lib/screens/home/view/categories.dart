import 'package:flutter/material.dart';
import 'package:otakoyi/repositories/repository.dart';
import 'package:otakoyi/screens/home/view/categories_list.dart';

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.915,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'BEST\nCATEGORIES',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontSize: 20),
                ),
                _SeeAllButton()
              ],
            ),
          ),
          SizedBox(height: 20.0),
          _CategoryTabBar(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

class _SeeAllButton extends StatelessWidget {
  const _SeeAllButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        'SEE ALL',
        style: TextStyle(
            letterSpacing: 1.0,
            color: Color.fromRGBO(199, 175, 103, 1),
            fontSize: 11.0),
      ),
      onTap: () {},
    );
  }
}

class _CategoryTabBar extends StatefulWidget {
  @override
  _CategoryTabBarState createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<_CategoryTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // give the tab bar a height [can change hheight to preferred height]
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: _TabBarButtons(tabController: _tabController),
          ),
          Expanded(
            child: _TabBarView(tabController: _tabController),
          ),
        ],
      ),
    );
  }
}

class _TabBarButtons extends StatelessWidget {
  final TabController tabController;

  const _TabBarButtons({Key key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: height * 0.06,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'FOR WOMAN'),
              Tab(text: 'FOR MEN'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 11.0),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: height * 0.033,
              child: VerticalDivider(color: Colors.grey, thickness: 1),
            ),
          ),
        )
      ],
    );
  }
}

class _TabBarView extends StatelessWidget {
  final TabController tabController;

  const _TabBarView({Key key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 15, right: 15),
      child: TabBarView(
        controller: tabController,
        children: [
          CategoriesList(categories: womanCategoriesList),
          Center(
            child: Text(
              'COMMING SOON',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
