import 'package:flutter/material.dart';

import '../theme/custom_colors.dart';
import 'svg_widget.dart';

void showSnackBar(BuildContext context, String textContent){
  final themeColor = Theme.of(context).extension<AppColors>()!;
  List<Widget> snackBackground =[
      Positioned(
        bottom: -10,
        left: 45,
        child: Container(
          height: 30,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: themeColor.secondaryColor??Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
      Positioned(
        bottom: -25,
        left: -20,
        child: customSVG(
          path: 'assets/shapes/circle.svg',
          size: 80,
        ),
      ),
      Positioned(
        top: 30,
        left: 30,
        child: customSVG(
          path: 'assets/shapes/circle.svg',
          size: 15,
        ),
      ),
    ];

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      dismissDirection: DismissDirection.horizontal,
      margin:const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
      content: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color:themeColor.backGroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 20,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: ClipRRect(

            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 5,
                  child: SizedBox(
                    width: 40,
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: (){
                          //color snackbar
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        child: Icon(
                          Icons.close,
                          color: themeColor.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                ...snackBackground,
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      textContent,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: themeColor.secondaryColor,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                            color: themeColor.backGroundColor??Colors.white,
                            blurRadius: 2,
                            spreadRadius: 15,
                            offset: const Offset(1, 1),
                          ),
                        ]
                      ),

                    ),
                  ),),
              ],
            ),
          )
      ),
      // action: SnackBarAction(
      //
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    ),
  );

}