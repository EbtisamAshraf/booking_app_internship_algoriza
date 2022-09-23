import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
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
              onTap: (() {
                Navigator.of(context).pushNamed(Routes.mapScreen);
              }),
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
        padding:
            EdgeInsets.fromLTRB(height * 0.01, 0, height * 0.01, height * 0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: height * 0.35,
              flexibleSpace: const FlexibleSpaceBar(
                background: SliverAppbar(),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
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
