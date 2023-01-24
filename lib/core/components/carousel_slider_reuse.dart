//
// import 'package:ethaqapp/config/components/component_constants.dart';
// import 'package:flutter/material.dart';
//
// import '../themes/colors.dart';
//
// class CarouselSliderReuse extends StatefulWidget {
//   const CarouselSliderReuse({
//     Key? key,
//     required this.images,
//   }) : super(key: key);
//   final List<String> images;
//
//   @override
//   State<CarouselSliderReuse> createState() => _CarouselSliderReuseState();
// }
//
// class _CarouselSliderReuseState extends State<CarouselSliderReuse> {
//   PageController pageController = PageController();
//   int _currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(.5),
//             borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
//           ),
//           margin: const EdgeInsets.symmetric(
//             horizontal: AppConstants.paddingLarge,
//           ),
//           child: CarouselSlider(
//             options: CarouselOptions(
//               autoPlay: true,
//               enlargeCenterPage: true,
//               viewportFraction: 1,
//               onPageChanged: (index, reason) {
//                 _currentPage = index;
//                 setState(() {});
//               },
//             ),
//             items: List.generate(
//               widget.images.length,
//               (index) => Image.asset(
//                 widget.images[index],
//                 width: double.infinity,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ),
//         DotsIndicator(
//           dotsCount: widget.images.length,
//           position: _currentPage.toDouble(),
//           decorator: const DotsDecorator(
//             color: AppColors.cDisActiveLight,
//             activeColor: AppColors.cPrimary,
//             activeSize: Size(18, 18),
//           ),
//         ),
//         // SmoothPageIndicator(
//         //   controller: PageController(
//         //     initialPage: _currentPage,
//         //   ),
//         //   count: widget.images.length,
//         //   effect: const ScaleEffect(
//         //     dotHeight: 8.0,
//         //     dotWidth: 8.0,
//         //     scale: 2,
//         //     dotColor: AppColors.cDisActiveLight,
//         //     activeDotColor: AppColors.cPrimary,
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
