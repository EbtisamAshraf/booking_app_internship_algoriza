import 'package:booking_app_internship_algoriza/core/widgets/hotel_explore_item.dart';
import 'package:booking_app_internship_algoriza/core/widgets/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          InkWell(
              onTap: (() {}),
              child: Padding(
                padding: EdgeInsets.only(right: height * 0.02),
                child: Image.asset(
                  'assets/images/map.png',
                  width: width * 0.1,
                ),
              ))
        ],
        leading: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            height * 0.01, height * 0.02, height * 0.01, height * 0.03),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: SliverAppbar(),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                return HotelExploreItem();
              }),
            ]))
          ],
        ),
      ),
    );
  }
}
