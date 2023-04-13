import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:virtual_chat_assistant/src/constants/colors.dart';
import 'package:virtual_chat_assistant/src/utils/size_config.dart';
import '../common_widgets/error_button.dart';


 class BotRoutes {
  static const main = '/';
  static const splash = '/splash';
  static const settings = '/settings';
  static const chat = '/chat';
  static const auth = '/auth';

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page, {int duration = 300}) {
    return PageRouteBuilder<T>(
        settings: settings,
        transitionDuration: Duration(milliseconds: duration),
        pageBuilder: (context, animation, secondaryAnimation) => page(context),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      });
  }
}

class RouterOffline extends StatelessWidget {
  const RouterOffline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/404_error.png',
            fit: BoxFit.cover,
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
          ),
          Positioned(
            bottom: getProportionateScreenHeight(235),
            left: getProportionateScreenWidth(35),
            child: Text(
              'Dead End',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: BotColors.backgroundColour),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(170),
            left: getProportionateScreenWidth(35),
            child: Text(
              'Your router is offline,\nPlease go to HOME.',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: BotColors.failureColor, fontWeight: FontWeight.w200),
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(120),
            left: getProportionateScreenWidth(35),
            child: ReusablePrimaryButton(
              childText: 'HOME',
              buttonColor: BotColors.backgroundColour,
              childTextColor: BotColors.failureColor,
              onPressed: () {
                 Navigator.pushNamedAndRemoveUntil(
                    context,
                    BotRoutes.splash,
                    (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
