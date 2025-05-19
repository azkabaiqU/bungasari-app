// import 'package:bungasari_app/preference/color.dart';
// import 'package:flutter/material.dart';
// import 'package:bungasari_app/presentation/home/page/home_page.dart';
// import 'package:bungasari_app/presentation/profile_page.dart';
//
// class CustomTabBar extends StatefulWidget {
//   const CustomTabBar({super.key});
//
//   @override
//   _CustomTabBarState createState() => _CustomTabBarState();
// }
//
// class _CustomTabBarState extends State<CustomTabBar> {
//   int _selectedIndex = 0;
//
//   void _onTabTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   final List<Widget> _pages = [
//     HomePage(),
//     ProfilePage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
//         child: Container(
//           height: 55,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(7),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 10,
//                 offset: Offset(1, -1),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _TabItem(
//                 iconPath: 'assets/image/icon-home.png',
//                 label: 'Home',
//                 isActive: _selectedIndex == 0,
//                 onTap: () => _onTabTapped(0),
//                 isImage: true,
//               ),
//               _TabItem(
//                 iconPath: 'assets/image/icon-pfp.png',
//                 label: 'Profile',
//                 isActive: _selectedIndex == 1,
//                 onTap: () => _onTabTapped(1),
//                 isImage: true,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _TabItem extends StatelessWidget {
//   final String label;
//   final bool isActive;
//   final VoidCallback onTap;
//   final String? iconPath;
//   final bool isImage;
//
//   const _TabItem({
//     required this.label,
//     required this.isActive,
//     required this.onTap,
//     this.iconPath,
//     this.isImage = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final opacityValue = isActive ? 1.0 : 0.4;
//
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//           padding: const EdgeInsets.symmetric(horizontal: 13, vertical:10 ),
//           decoration: BoxDecoration(
//             color: isActive ? AppColor.bgBasic : AppColor.bgWhite ,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Opacity(
//             opacity: opacityValue,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 isImage
//                     ? Image.asset(
//                   iconPath!,
//                   width: 20,
//                   height: 20,
//                   color: Colors.black,
//                 )
//                     : Icon(
//                   Icons.home_filled,
//                   color: Colors.black,
//                   size: 20,
//                 ),
//                 const SizedBox(width: 6),
//                 Text(
//                   label,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
