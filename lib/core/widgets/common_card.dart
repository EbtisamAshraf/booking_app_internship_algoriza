// import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
// import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
// import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class CommonCard extends StatelessWidget {
//   final HotelsModel hotelsModel;
//   final DataHotels dataHotels;
//   const CommonCard({Key? key,required this.hotelsModel,required this.dataHotels}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 20.0, vertical: 10),
//       child: Container(
//         height: 150,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Card(
//           shape: RoundedRectangleBorder(
//               borderRadius:
//               BorderRadius.circular(15)),
//           child: Row(
//             crossAxisAlignment:
//             CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius:
//                 const BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   bottomLeft: Radius.circular(15),
//                 ),
//                 child:
//                 CachedNetworkImage(
//                   imageUrl:
//                   'http://api.mahmoudtaha.com/images/${hotelsModel.data!.data![0].hotelImages!}',
//                   width: 120,
//                   height: 150,
//                   placeholder: (context, url) =>
//                   const Center(
//                       child: CustomLoadingWidget()),
//                   errorWidget: (context, url, error) =>
//                       Image.asset(
//                         'assets/images/hotel5.png',
//                         width: 120,
//                         height: 150,
//                         fit: BoxFit.fitHeight,
//                       ),
//                 ),
//
//                 //     Image.asset(
//                 //   'assets/images/hotel.jpg',
//                 //   width: 120,
//                 //   height: 150,
//                 //   fit: BoxFit.fitHeight,
//                 // ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment:
//                   CrossAxisAlignment.start,
//                   mainAxisAlignment:
//                   MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       hotelsModel.data!
//                           .data![index].name!,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       state.hotelsModel.data!
//                           .data![index].address!,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: AppColors.hintColor,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment:
//                         CrossAxisAlignment
//                             .start,
//                         mainAxisAlignment:
//                         MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 '2.0 km to city',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: AppColors
//                                       .hintColor,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 'EGP ${state.hotelsModel.data!.data![index].price}',
//                                 style: const TextStyle(
//                                     color: Colors
//                                         .black,
//                                     fontSize: 18,
//                                     fontWeight:
//                                     FontWeight
//                                         .bold),
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               RatingBarIndicator(
//                                 rating: double
//                                     .parse(state
//                                     .hotelsModel
//                                     .data!
//                                     .data![
//                                 index]
//                                     .rate!),
//                                 itemBuilder:
//                                     (context,
//                                     index) =>
//                                 const Icon(
//                                   Icons.star,
//                                   color: AppColors
//                                       .defaultColor,
//                                 ),
//                                 itemSize: 20.0,
//                                 direction:
//                                 Axis.horizontal,
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 ' ${state.hotelsModel.data!.data![index].rate!}  Rate',
//                                 style: TextStyle(
//                                     color: AppColors
//                                         .hintColor),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
