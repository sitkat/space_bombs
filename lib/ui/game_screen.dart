import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:space_bombs/data/level_state.dart';
import 'package:space_bombs/theme/app_colors.dart';
import 'package:space_bombs/theme/app_container.dart';

import '../data/game_provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key, required this.state}) : super(key: key);

  final LevelState state;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<String> planets;
  late List<bool> isBomb;
  late List<bool> cardOpened;
  late List<int> shuffledIndexes;

  int foundBomb = 0;

  Timer? _timer;
  late Duration remainingTime;

  void initState() {
    remainingTime = GameProvider.getGameState(widget.state).time;
    _startTimer();

    super.initState();
    planets =
        List.generate(15, (index) => 'assets/images/planet${index + 1}.png');
    isBomb = List.filled(27, false);
    placeBombsRandomly();
    cardOpened = List.filled(27, false);
    shuffledIndexes = List.generate(27, (index) => index)..shuffle();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant GameScreen oldWidget) {
    _timer?.cancel();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final level = GameProvider.getGameState(widget.state);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/game.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        AppContainer(
                          child: Row(
                            children: [
                              _buildContainer(AppColors.accent, 'Level'),
                              _buildPadding('1 / 5'),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        _buildContainer(level.backgroundColor, level.text),
                      ],
                    ),
                  ),
                  AppContainer(
                    child: Row(
                      children: [
                        AppContainer(
                          color: AppColors.accent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            child: Icon(Icons.timer),
                          ),
                        ),
                        _buildPadding(
                            '00:${(remainingTime.inSeconds % 60).toString().padLeft(2, '0')}'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildMenuButton(),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: _buildGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime -= const Duration(seconds: 1);
        }
      });
    });
  }

  void placeBombsRandomly() {
    var random = Random();
    int bombsToPlace = GameProvider.getGameState(widget.state).numberOfBombs;

    while (bombsToPlace > 0) {
      int index = random.nextInt(27);
      if (!isBomb[index]) {
        isBomb[index] = true;
        bombsToPlace--;
      }
    }
  }

  void onCardTap(int index) {
    setState(() {
      if (!cardOpened[index]) {
        cardOpened[index] = true;

        if (isBomb[index]) {
          foundBomb++;
          if (foundBomb ==
              GameProvider.getGameState(widget.state).numberOfBombs)
            showAlertDialog();
        }
      }
    });
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.card,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/emptyBomb.png',
                    width: 54,
                  ),
                  Image.asset(
                    'assets/images/emptyBomb.png',
                    width: 54,
                  ),
                  Image.asset(
                    'assets/images/emptyBomb.png',
                    width: 54,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'You found all the bombs.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteWithOpacity,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Level complete',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteWithOpacity,
                  ),
                  children: [
                    const TextSpan(text: 'You’ve passed the '),
                    TextSpan(
                      text: GameProvider.getGameState(widget.state).text,
                      style: TextStyle(
                          color: GameProvider.getGameState(widget.state)
                              .backgroundColor),
                    ),
                    const TextSpan(text: '\nlevel difficulty level.'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _builtButton(() {}, 'Back to menu'),
                const SizedBox(width: 10),
                _builtButton(() {}, 'The next difficulty'),
              ],
            ),
          ],
        );
      },
    );
  }

  final textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  Widget _buildContainer(Color backgroundColor, String text) {
    return AppContainer(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }

  Widget _buildPadding(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }

  Widget _buildMenuButton() {
    return InkWell(
      onTap: () {},
      child: AppContainer(
        child: Row(
          children: [
            AppContainer(
              color: AppColors.accent,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Icon(Icons.menu),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 9,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: 27,
      itemBuilder: (context, index) {
        bool isBomb = this.isBomb[index];
        bool isOpened = cardOpened[index];

        return GestureDetector(
          onTap: () => onCardTap(index),
          child: AppContainer(
            radius: 16.0,
            color: isOpened ? (isBomb ? AppColors.accent : AppColors.card) : AppColors.card,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                isOpened
                    ? (isBomb
                    ? 'assets/images/imgBomb.png'
                    : planets[shuffledIndexes[index] % 9])
                    : 'assets/images/unknownBomb.png',
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _builtButton(VoidCallback onPressed, String text) {
    return InkWell(
      onTap: onPressed,
      child: AppContainer(
        color: AppColors.accent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
