import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_button.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/search.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double currentSliderValue = 5;
    RangeValues currentRangeValues = const RangeValues(200, 700);
    return BlocProvider(
      create: (context) => di.sl<HotelsCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.cancel_outlined)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Filter', style: Theme.of(context).textTheme.displayMedium),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 16, 0, 40),
                child: Text('Price (for 1 night)',
                    style: Theme.of(context).textTheme.displaySmall),
              ),
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return RangeSlider(
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor.withOpacity(0.3),
                    values: currentRangeValues,
                    max: 1000,
                    divisions: 10,
                    labels: RangeLabels(
                      '\$${currentRangeValues.start.round()}',
                      '\$${currentRangeValues.end.round()}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        currentRangeValues = values;
                      });
                    },
                  );
                  ;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 16, 0, 20),
                child: Text('Facilities',
                    style: Theme.of(context).textTheme.displaySmall),
              ),
              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  padding: EdgeInsets.zero,
                  childAspectRatio: 2 / 0.4,
                  children: List.generate(
                      5,
                      (index) => SizedBox(
                            child: Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                const Text('data')
                              ],
                            ),
                          )),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 16, 0, 40),
                child: Text('Distance from city center',
                    style: Theme.of(context).textTheme.displaySmall),
              ),
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Slider(
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor.withOpacity(0.3),
                      thumbColor: AppColors.primaryColor,
                      value: currentSliderValue,
                      max: 10,
                      divisions: 10,
                      label: 'Less than ${currentSliderValue.round()} Km',
                      onChanged: (double value) {
                        setState(() {
                          currentSliderValue = value;
                        });
                      });
                },
              ),
              const Spacer(),
              BlocBuilder<HotelsCubit, HotelStates>(
                builder: (context, state) {
                  return customElevatedButton(
                      onPressed: () {
                        HotelsCubit.get(context).search(
                            searchParam: SearchParam(
                                // distance: currentSliderValue,
                                // minPrice:currentRangeValues.start.round() ,
                                // maxPrice: currentRangeValues.end.round(),
                                count: 10,
                                page: 1));
                      },
                      text: 'apply',
                      context: context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
