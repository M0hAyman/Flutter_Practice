import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:lab2/styled_text.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currDiceRollNum = 2;
  void rollDice() {
    setState(() {
      currDiceRollNum = randomizer.nextInt(6) + 1;
      //print('Dice rolled');
    });
  }

  @override
  build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //StyledText('Hello World!'),
        Image.asset(
          'assets/images/dice-$currDiceRollNum.png',
          width: 200,
        ),
        const SizedBox(
          //The size you set for the sizedbox will set in stone/ fixed size
          //If you added other child widgets, if they can not fit, they will be cut off
          height: 20,
        ),
        //Flutter supports 3 different main buttons
        //1. Button that has a background color and slight shadow
        //ElevatedButton(onPressed: onPressed, child: child)
        //2. Button that has no background but a border
        //OutlinedButton(onPressed: onPressed, child: child)
        //3. Button that has a pressable text
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(
            //   top: 20,
            // ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
