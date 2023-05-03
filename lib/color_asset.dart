// ignore_for_file: constant_identifier_names, camel_case_types

// import 'package:flutter/material.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-03 15:35:48
 * Last Modified: 2023-05-03 15:40:12
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 컬러 정의가 모두 되어 있지 않아 우선 주석처리 - hslee 2023.05.03
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

// class boxDecoration {
//   static BoxDecoration BoxDecorationrectangleGradient= const BoxDecoration(
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12)
//       ),
//         gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [
//           colorSet.Colorblack,
//           colorSet.ColornavyShade800,
//         ],
//       ),
//   );

//   static const BoxDecorationblackOpacity800Deco= BoxDecoration(
//         color: colorSet.Colorblack.withOpacity(0.8),
//         borderRadius: BorderRadius.all(Radius.circular(4))
//         );

//   static const BoxDecorationnavyGreyShade500Deco= BoxDecoration(
//       color: colorSet.navy.navyGreyShade500,
//       borderRadius: BorderRadius.all(Radius.circular(4))
//   );

//   static const BoxDecorationborderCircularthistleShade650= BoxDecoration(
//       color: colorSet.darkNavyShade850,
//       borderRadius: BorderRadius.circular(5),
//       border: Border.all(
//         width:1,
//         color: colorSet.thistleShade650,
//       )
//   );

//   static const BoxDecorationnavyShadeGradient= BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//         color: colorSet.navyShade750.withOpacity(0.5),
//         spreadRadius: 3,
//         blurRadius: 15,
//         offset: Offset(0,5),
//       ),
//     ],
//     gradient: LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [
//         colorSet.black,
//         colorSet.navyShade800,
//       ],
//     ),
//   );

//   static const BoxDecorationdarkNavyGradient= BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//         color: Colors.white54,
//         spreadRadius: 1,
//         blurRadius: 5,
//         offset: Offset(0,0),
//       ),
//     ],
//     borderRadius: BorderRadius.circular(10),
//     gradient: LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [
//         Colors.black,
//         Color(0xff0B0124),
//         Color(0xff1B1741),
//       ],
//     ),
//   );

//   static const BoxDecorationdeepDarkNavyGradient= BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [
//           Color(0xff0B0124),
//           Color(0xff1B1741),
//         ],
//       )
//   );

//   static const BoxDecorationblackPurpleGradientNoShadow= BoxDecoration(
//       gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.black87,
//             Color(0xf2291037),
//             Color(0xf2291037),
//             Colors.black87,
//           ]));

//   static const BoxDecorationblackPurpleGradientShadow= BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Colors.deepPurpleAccent.withOpacity(0.5),
//           spreadRadius: 5,
//           blurRadius: 8,
//           offset: Offset(0, 3),
//         ),
//       ],
//       gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.black87,
//             Color(0xf2291037),
//             Color(0xf2291037),
//             Colors.black87,
//           ]));

//   static constBoxDecorationtopDownBordermauveShade350=  BoxDecoration(
//       border: Border(
//         top: BorderSide(
//           width:1.0,
//           color: colorSet.mauveShade350,
//         ),
//         bottom: BorderSide(
//           width:1.0,
//           color: colorSet.mauveShade350,
//         ),
//       )
//   );

//   static BoxDecoration BoxDecorationtopDownBorderWhiteOpacity300=  BoxDecoration(
//       border: Border(
//         top: BorderSide(
//           width:1.0,
//           color: colorSet.whiteOpacity300,
//         ),
//         bottom: BorderSide(
//           width:1.0,
//           color: colorSet.whiteOpacity300,
//         ),
//       )
//   );

//   static BoxDecoration BoxDecorationbottomBorderCircularGreyShade900= BoxDecoration(
//       color: colorSet.greyShade900,
//       borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(10),
//           bottomRight: Radius.circular(10)
//       )
//   );
// }

// class summaryInfoBoxColorset{static const ColorbackgroundColor= Color(0xff1A163D);
//   static const ColorinfoTitleColor= Color(0xffcacaff);
//   static const ColorinformationColor= Colors.white;
// }

// class colorSet {
//   static const Colortransparent=  Color.fromRGBO(0, 0, 0, 0);
//   static const Colorwhite= Color.fromRGBO(255, 255, 255, 1);
//   static const ColorwhiteOpacity300= Color.fromRGBO(255, 255, 255, 0.3);
//   static const ColordarkGrey= Color.fromRGBO(128, 128, 128, 1);
//   static const Colorgrey= Color.fromRGBO(158, 158, 158, 1);
//   static const ColorgreyShade800= Color.fromRGBO(66, 66, 66, 1);
//   static const ColorgreyShade900= Color.fromRGBO(39, 39, 47, 1);
//   static const Colorblack= Color.fromRGBO(0, 0, 0, 1);
//   static const ColorblackOpacity380= Color.fromRGBO(0, 0, 0, 0.38);
//   static const ColordarkNavyShade850= Color.fromRGBO(15, 6, 47,1);
//   static const ColordarkNavyShade900= Color.fromRGBO(12, 12, 35, 1);
//   static const ColordarkNavyShade950= Color.fromRGBO(11, 1, 36, 1);
//   static const Colornavy= Color.fromRGBO(41, 38, 67, 1);
//   static const ColornavyShade750= Color.fromRGBO(33, 30, 73, 1);
//   static const ColornavyShade800= Color.fromRGBO(27, 23, 65, 1);
//   static const ColornavyShade850= Color.fromRGBO(26, 22, 61, 1);
//   static const ColornavyShade900= Color.fromRGBO(21, 17, 56, 1);
//   static const ColornavyShade950= Color.fromRGBO(20, 16, 56, 1);
//   static const ColornavyGreyShade500= Color.fromRGBO(48, 48, 79, 1);
//   static const ColornavyGreyShade550= Color.fromRGBO(45, 44, 92, 1);
//   static const ColornavyGreyShade600= Color.fromRGBO(34, 30, 73, 1);
//   static const ColornavyGreyShade650= Color.fromRGBO(30, 30, 63, 1);
//   static const ColorvioletShade750= Color.fromRGBO(112, 48, 160, 1);
//   static const ColordeepPurple= Color.fromRGBO(103, 58, 183, 1);
//   static const ColordeepPurpleAccent= Color.fromRGBO(124, 77, 255, 1);
//   static const ColordeepPurpleAccentShade650= Color.fromRGBO(102, 0, 255,1);
//   static const ColordeepPurpleShade600= Color.fromRGBO(150, 31, 255, 1);
//   static const ColordeepPurpleShade800= Color.fromRGBO(69, 39, 160, 1);
//   static const ColormauveShade250= Color.fromRGBO(202, 189, 233, 1);
//   static const ColormauveShade350= Color.fromRGBO(215, 178, 252, 1);
//   static const ColorthistleShade600Opacity450= Color.fromRGBO(112, 48, 160, 0.45);
//   static const ColorthistleShade600Opacity600= Color.fromRGBO(147, 132, 177, 1);
//   static const ColorthistleShade650= Color.fromRGBO(142, 129, 176, 1);
//   static const ColormediumPurpleShade350= Color.fromRGBO(177, 154, 241, 1);
//   static const ColormediumPurpleShade400= Color.fromRGBO(177, 139, 243, 1);
//   static const ColormediumPurpleShade450= Color.fromRGBO(151, 104, 232, 1);
//   static const ColormediumPurpleShade500= Color.fromRGBO(114, 64, 215, 1);
//   static const ColormediumPurpleShade550= Color.fromRGBO(117, 40, 233, 1);
//   static const ColormediumPurpleShade600= Color.fromRGBO(109, 0, 233, 1);
//   static const ColorlightPurpleShade650= Color.fromRGBO(147, 97, 255, 1);
//   static const Colorpurple= Color.fromRGBO(217, 34, 255, 1);
//   static const ColordarkVioletShade450= Color.fromRGBO(102, 0,204, 1);
//   static const ColororchidShade400= Color.fromRGBO(227, 152, 233, 1);
//   static const Colorpink= Color.fromRGBO(252, 131, 255, 1);
//   static const ColorpurplePink= Color.fromRGBO(255, 36, 255, 1);
//   static const ColordeepPink= Color.fromRGBO(255, 0, 177, 1);
//   static const ColorredPink= Color.fromRGBO(255, 0, 116, 1);
//   static const ColorredVioletShade550= Color.fromRGBO(255, 51, 153, 1);
//   static const ColorlightCoralShade400= Color.fromRGBO(255, 128, 166, 1);
//   static const ColorlightCoralShade500= Color.fromRGBO(255, 79, 138, 1);
//   static const ColorlightCoralShade700= Color.fromRGBO(255, 46, 119, 1);
//   static const ColorlightCoralShade750= Color.fromRGBO(255, 0, 106, 1);
//   static const ColorlightCoralShade800= Color.fromRGBO(255, 0, 92, 1);
//   static const ColormediumVioletRedShade400= Color.fromRGBO(153, 0,153, 1);
//   static const ColorplumShade450Opacity450= Color.fromRGBO(255, 51, 153, 0.45);
//   static const Colorplum= Color.fromRGBO(255, 121, 166, 1);
//   static const ColorplumShade700= Color.fromRGBO(204, 102, 153, 1);
//   static const ColorlightSalmonShade250= Color.fromRGBO(255, 200, 200, 1);
//   static const ColorlightSalmonShade300= Color.fromRGBO(255, 181, 191, 1);
//   static const ColorsalmonShade600= Color.fromRGBO(248, 136, 149, 1);
//   static const ColorpeachPuffShade550= Color.fromRGBO(255, 204, 153, 1);
//   static const ColororangeAccent= Color.fromRGBO(255, 171, 64, 1);
//   static const ColororangeShade200= Color.fromRGBO(255, 181, 131, 1);
//   static const ColororangeShade400= Color.fromRGBO(255, 127, 78, 1);
//   static const ColororangeShade700= Color.fromRGBO(255, 66, 0, 1);
//   static const ColororangeRed= Color.fromRGBO(255, 80, 80, 1);
//   static const ColororangeRedShade600= Color.fromRGBO(153, 51,0, 1);
//   static const ColordeepOrange= Color.fromRGBO(255, 87, 34, 1);
//   static const ColortomatoShade300= Color.fromRGBO(255, 113, 113, 1);
//   static const Colortomato= Color.fromRGBO(255, 90, 90, 1);
//   static const Colorred= Color.fromRGBO(255, 0, 0, 1);
//   static const ColorskyOpacity450= Color.fromRGBO(102, 255, 255, 0.45);
//   static const ColorlightSkyBlueShade700Opacity450= Color.fromRGBO(0, 176, 240, 0.45);
//   static const ColorpaleTurquoise= Color.fromRGBO(200, 255, 255, 1);
//   static const ColortearShade450= Color.fromRGBO(0, 128,128, 1);
//   static const ColortealAccent= Color.fromRGBO(100, 255, 218, 1);
//   static const ColorturquoiseShade200= Color.fromRGBO(0, 255, 224, 1);
//   static const ColorcyanShade400= Color.fromRGBO(102, 255, 255, 1);
//   static const Colorcyan= Color.fromRGBO(18, 255, 255, 1);
//   static const ColorcyanShade500= Color.fromRGBO(0, 231, 255, 1);
//   static const ColorcyanShade550= Color.fromRGBO(0, 235, 230, 1);
//   static const ColoraquaMarineShade650= Color.fromRGBO(89, 212, 213, 1);
//   static const ColordarkTurquoise= Color.fromRGBO(0, 165, 168, 1);
//   static const ColordarkTurquioseShade600= Color.fromRGBO(15, 135, 135, 1);
//   static const ColormediumSeaCreanShade350OOpacity450= Color.fromRGBO(0, 176, 80, 0.45);
//   static const ColorlightGreenShade300= Color.fromRGBO(204, 255, 153, 1);
//   static const ColorlightGreen= Color.fromRGBO(125, 255, 0, 1);
//   static const ColorlightGreenAccent= Color.fromRGBO(178, 255, 89, 1);
//   static const ColorlightGreenShade500= Color.fromRGBO(0, 255, 139, 1);
//   static const Colorgreen= Color.fromRGBO(0, 204, 153, 1);
//   static const ColorgreenShade700= Color.fromRGBO(0, 176, 80, 1);
//   static const ColorlightYellow= Color.fromRGBO(255, 238, 169, 1);
//   static const ColorlightYellowShade500= Color.fromRGBO(255, 239, 126, 1);
//   static const ColoryellowOpacity450= Color.fromRGBO(255, 255, 0, 0.45);
//   static const Coloryellow= Color.fromRGBO(255, 255, 0, 1);
//   static const Colorgold= Color.fromRGBO(255, 212, 0, 1);
//   static const ColoramberAccent= Color.fromRGBO(255, 215, 64, 1);
//   static const ColordodgerBlueShade600= Color.fromRGBO(33, 150, 243, 1);
//   static const ColorskyBlueShade550= Color.fromRGBO(0, 176, 240, 1);
//   static const ColorskyBlueShade600= Color.fromRGBO(0, 170, 255, 1);
//   static const ColorskyBlueShade800= Color.fromRGBO(0, 112, 192, 1);
//   static const ColorpowderBlueShade500= Color.fromRGBO(153, 204, 255, 1);
//   static const Colorindigo= Color.fromRGBO(63, 81, 181, 1);
//   static const ColorpowderBlueShade650Opacity450= Color.fromRGBO(0, 112, 192, 0.45);
//   static const ColorlightSteelBlueShade200= Color.fromRGBO(204, 214, 231, 1);
//   static const ColorlightSteelBlueShade400= Color.fromRGBO(202, 202, 255, 1);
//   static const ColorlightSteelBlueShade550Opacity450= Color.fromRGBO(51, 51, 204, 0.45);
//   static const ColorlightBlueShade450= Color.fromRGBO(153, 153, 255, 1);
//   static const ColorlightBlueShade500= Color.fromRGBO(100, 141, 255, 1);
//   static const ColorlightBlueShade600= Color.fromRGBO(99, 95, 255, 1);
//   static const ColorlightBlueShade850= Color.fromRGBO(51, 51, 204, 1);
//   static const ColormediumBlueShade450= Color.fromRGBO(0, 51,153, 1);
//   static const ColormediumBlueShade500= Color.fromRGBO(0, 48, 135, 1);
//   static const Colorblue= Color.fromRGBO(0, 104, 255, 1);
//   static const ColorblueGrey= Color.fromRGBO(96, 125, 139, 1);
//   static const ColorblueShade600= Color.fromRGBO(0, 50, 234, 1);
//   static const ColorcornFlowerBlue= Color.fromRGBO(102, 102, 255, 1);
//   static const Colorcobalt= Color.fromRGBO(89, 29, 255, 1);
//   static const ColordarkKhaki= Color.fromRGBO(102, 102,51, 1);
//   static const List<Color>darkNavyShade950ToBlack=[Color.fromRGBO(11, 1, 36, 1), Color.fromRGBO(0, 0, 0, 1)];
//   static const List<Color>darkNavyShade950ToDarkStateBlueShade800Opacity800= [Color.fromRGBO(11, 1, 36, 0.8), Color.fromRGBO(23, 0, 70, 0.8)];
//   static const List<Color>pinkOrangeShade200= [Color.fromRGBO(233, 30, 99, 1), Color.fromRGBO(76, 175, 86, 1)];
// }
