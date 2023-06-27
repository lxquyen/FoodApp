import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/travel_app/misc/colors.dart';
import 'package:flutter_tutorial/widgets/app_large_text.dart';
import 'package:flutter_tutorial/widgets/app_text.dart';
import 'package:flutter_tutorial/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final colors = [Colors.white, Colors.redAccent, Colors.yellowAccent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: colors.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(color: colors[index]),
              child: Container(
                margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: 'Trips',
                        ),
                        AppText(text: 'Mountain', size: 30),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: AppText(
                            text: 'Mountain hikes give you an incredible sense of freedom along with endurance test',
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ResponsiveButton(
                          width: 120,
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                              color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
