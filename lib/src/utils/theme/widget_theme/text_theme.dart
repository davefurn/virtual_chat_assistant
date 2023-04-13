import 'package:flutter/material.dart';
import 'package:virtual_chat_assistant/src/constants/colors.dart';

class TextsTheme {
  static TextTheme lightTheme = const TextTheme(
    //titles
    headlineLarge: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
      fontSize: 23,
    ),
    //elevated buttons
    labelMedium: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
      fontSize: 19,
    ),
    //for online or not
    displayMedium:  TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      fontSize: 17,
      color: BotColors.activeColor,
    ),
    // for chats user
    bodyMedium: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
      fontSize: 13,
    ),
    //reply bot
    bodySmall : TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    

  );
   static TextTheme darkTheme = const TextTheme(
    //titles
    headlineLarge: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
      fontSize: 23,
    ),
    //elevated buttons
    labelMedium: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
      fontSize: 19,
    ),
    //for online or not
    displayMedium:  TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      fontSize: 17,
      color: BotColors.activeColor,
    ),
    // for chats user
    bodyMedium: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
      fontSize: 13,
    ),
    //reply bot
    bodySmall : TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    

  );
}
