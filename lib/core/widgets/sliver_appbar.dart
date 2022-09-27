import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_search_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SliverAppbar extends StatelessWidget {
  const SliverAppbar({Key? key, this.onPressedSearch, required this.searchForm}) : super(key: key);
  final VoidCallback? onPressedSearch;
  final Widget searchForm;
  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             Expanded(child: searchForm), //CustomSearchForm(hint: 'Egypt.......')
              Container(
                height: height * 0.15,
                width: width * 0.15,
                decoration: BoxDecoration(
                 shape: BoxShape.circle, 
                 color: Colors.teal.shade300,
                ),
                child: IconButton(onPressed: onPressedSearch, icon:const Icon(Icons.search,size: 30,color: Colors.white,)),
              )
            ],
          ),
          SizedBox(height: height * 0.01,),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose Date',style: Theme.of(context).textTheme.displaySmall,),
                    SizedBox(height: height * 0.02,),
                    Text('19, Sep - 24, Sep',style: Theme.of(context).textTheme.bodySmall,)
                  ],
                ),
                 VerticalDivider(
                  thickness: 1,
                  width: width * 0.02,
                  color: Colors.grey,
                 ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Number of room ',style: Theme.of(context).textTheme.displaySmall,),
                    SizedBox(height: height * 0.02,),
                    Text('1 room 2 People',style: Theme.of(context).textTheme.bodySmall,)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('200  Hotel found',style: Theme.of(context).textTheme.displaySmall,),
              TextButton.icon(onPressed: (){
                Navigator.pushNamed(context, Routes.filterScreen);
              },
              icon: const Icon(Icons.sort_rounded,color: Colors.teal,), 
              label: Text('Filter',style: Theme.of(context).textTheme.bodyMedium,)),
            ],
          ),
        ],
      ),
    );
  }
}
