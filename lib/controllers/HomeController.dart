import 'dart:ui';

import 'package:challenge/models/card_model.dart';
import 'package:flutter/widgets.dart' as w;
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class HomeController with Store {
  static List<CardModel> get cards {
    return [
      CardModel(
        name: "Diving",
        image: "https://imgur.com/4AY5G2z.png",
        colors: [
          Color(0xFF01F2DF),
          Color(0xFF09C5C6),
          Color(0xFF01F2DF),
        ],
      ),
      CardModel(
        name: "Hiking",
        image: "https://i.imgur.com/9DseTKd.png",
        colors: [
          Color(0xFFFDD7D6),
          Color(0xFFF0A0A3),
          Color(0xFFFDD7D6),
        ],
      ),
    ];
  }

  Observable<CardModel> _card = Observable(cards.first);

  CardModel get card => _card.value;

  void setCardModel(CardModel card) {
    return Action(() {
      _card.value = card;
      final animationController = GetIt.I.get<w.AnimationController>();
      if (animationController.isCompleted) {
        animationController.reverse();
      }
    })();
  }
}
