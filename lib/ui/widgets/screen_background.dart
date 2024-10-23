import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilis/assets_path.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
  Size screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Stack(
      
        children: [
          SvgPicture.asset(AssetsPath.backgroundSvg,
            fit:BoxFit.cover,
      
            width: screenSize.width,
           height: screenSize.height,
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}