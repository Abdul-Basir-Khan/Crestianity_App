import 'package:flutter/material.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';

class LockScreenBottomSheet extends StatefulWidget {
  const LockScreenBottomSheet({Key? key}) : super(key: key);

  @override
  State<LockScreenBottomSheet> createState() => _LockScreenBottomSheetState();
}

class _LockScreenBottomSheetState extends State<LockScreenBottomSheet> {
  int _slideIndex = 0;
  int _tabIndex = 0;
  final List<String> tabsList = ['Home screen', 'Lock screen'];

  void _onNext() {
    if (_slideIndex < 2) {
      setState(() => _slideIndex++);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonText = _slideIndex == 0 || _slideIndex == 2 ? 'Continue' : 'Got it';

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Close icon
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Color(0xff101010)),
            ),
          ),
          const SizedBox(height: 20),

          // Dynamic screen
          Expanded(child: _buildScreen()),

          // Next/Got it button
          CustomButton(
            onTap: _onNext,
            title: buttonText,
            isRequiredArrow: false,
          ),
        ],
      ),
    );
  }

  Widget _buildScreen() {
    switch (_slideIndex) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/chat_main/Frame 1410067661.png"),
            const SizedBox(height: 30),
            const Text(
              'Add a widget to your home screen',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF664F42),
                fontSize: 36,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Easily add widgets to your home screen for quick access to daily Bible verses. Follow the steps and stay inspired!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF292929),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );

      case 1:
        return Column(
          children: [
            // tabs row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(tabsList.length, (i) {
                final sel = _tabIndex == i;
                return GestureDetector(
                  onTap: () => setState(() => _tabIndex = i),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: sel ? const Color(0xFF664F42) : Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: sel ? Colors.transparent : const Color(0xFFA8A8A8),
                      ),
                    ),
                    child: Text(
                      tabsList[i],
                      style: TextStyle(
                        color: sel ? const Color(0xFFF7D3BD) : const Color(0xFFA8A8A8),
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            // tab content
            Expanded(child: _buildTabContent()),
          ],
        );

      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/chat_main/Frame 1410067661.png"),
            const SizedBox(height: 30),
            const Text(
              'Select your preferred widget for the home screen',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF664F42),
                fontSize: 36,
                fontFamily: 'Quincy CF',
                fontWeight: FontWeight.w700,
              ),
            ),

          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTabContent() {
    if (_tabIndex == 0) {
      // Home-screen steps
      return ListView(
        children: [
          _stepRow(
            '1',
            'Touch & hold an empty area until the app jiggles',
            "assets/home_navigation/1.png",
          ),
          const SizedBox(height: 30),
          _stepRow(
            '2',
            'Tap the + button in the upper-left corner',
            "assets/home_navigation/2.png",
          ),
          const SizedBox(height: 30),
          _stepRow(
            '3',
            'Search for myChristianity and tap to add widgets',
            "assets/home_navigation/3.png",
          ),
        ],
      );
    } else {
      // Lock-screen steps
      return ListView(
        children: [
          _stepRow(
            '1',
            'Touch & hold the lock screen, then tap Customize',
            "assets/home_navigation/4.png",
          ),
          const SizedBox(height: 30),
          _stepRow(
            '2',
            'Select Lock Screen',
            "assets/home_navigation/5.png",
          ),
          const SizedBox(height: 30),
          _stepRow(
            '3',
            'Tap Widget section and Add Widgets',
            "assets/home_navigation/6.png",
          ),
        ],
      );
    }
  }

  Widget _stepRow(String step, String text, String asset) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step,
                style: const TextStyle(
                  color: Color(0xFF292929),
                  fontSize: 24,
                  fontFamily: 'Quincy CF',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF292929),
                  fontSize: 14,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Image.asset(asset),
      ],
    );
  }
}
