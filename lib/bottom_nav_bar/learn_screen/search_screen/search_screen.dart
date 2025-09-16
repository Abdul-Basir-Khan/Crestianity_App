import 'package:flutter/material.dart';
import 'package:my_cristianity_app/widget/reusable_text_form.dart';
import 'package:svg_flutter/svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  // 1) your dummy data to search in:
  final List<String> _dummyItems = [
    'Booking this week',
    'Journey through salvation history',
    'How to study the bible',
    'Travel plan 2025',
    'Morning prayer routine',
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 2) filter on every build:
    final query = _controller.text.trim().toLowerCase();
    final matches = query.isEmpty
        ? <String>[]
        : _dummyItems
        .where((item) => item.toLowerCase().contains(query))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xffFFFAEB),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          children: [
            // — your existing search bar + cancel —
            Row(
              children: [
                Expanded(
                  child: ReusableTextForm(
                    controller: _controller,
                    autofocus: true,
                    hintText: 'Search plans',
                    filledColor: const Color(0xf80FFFFFF),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_controller.text.isNotEmpty)
                          GestureDetector(
                            onTap: () => _controller.clear(),
                            child: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xf80737373),
                              child: Icon(Icons.close, color: Colors.white, size: 18),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset("assets/home_navigation/search 8.svg"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF664F42),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.48,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 3) if the user has typed and found matches, show them:
            if (query.isNotEmpty && matches.isNotEmpty) ...[
              // heading for your suggestions
              const Text(
                'Search results',
                style: TextStyle(
                  color: Color(0xFF101010),
                  fontSize: 20,
                  fontFamily: 'Quincy CF',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              ...matches.map((m) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child:
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xF16737373),
                      child: SvgPicture.asset(
                          height: 20,width: 20,
                          "assets/home_navigation/search 8.svg"),
                    ),
                    const SizedBox(width: 16),
                   Text(
                    m,
                      style: TextStyle(
                        color: Color(0xFF101010),
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

              )),
              const SizedBox(height: 30),
            ],

            // 4) if they typed but nothing matched:
            if (query.isNotEmpty && matches.isEmpty) ...[
              const SizedBox(height: 80),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/learning_screen/search_failed.png"),
                    const SizedBox(height: 16),
                    Text(
                      'No research results',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF292929),
                        fontSize: 24,
                        fontFamily: 'Quincy CF',
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'You don’t have any activities in progress.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF737373),
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],

            // 5) show trending only when no search OR when matches found:
            if (query.isEmpty || matches.isNotEmpty) ...[
              const Text(
                'Trending searches',
                style: TextStyle(
                  color: Color(0xFF101010),
                  fontSize: 20,
                  fontFamily: 'Quincy CF',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xF16737373),
                    child: SvgPicture.asset("assets/learning_screen/flash.svg"),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Trending searches',
                    style: TextStyle(
                      color: Color(0xFF101010),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
