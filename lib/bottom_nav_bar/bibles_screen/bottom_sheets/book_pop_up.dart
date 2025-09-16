import 'package:flutter/material.dart';

class BookPopUp extends StatefulWidget {
  const BookPopUp({super.key});

  @override
  State<BookPopUp> createState() => _BookPopUpState();
}

class _BookPopUpState extends State<BookPopUp> {
  int _currentIndex = 0;
  int? expandedIndex;

  final List tabsData = ['Traditional', 'Alphabetical'];
  final List<String> traditionData = [
    'Jakobus',
    'Philipper',
    'Kolosser',
    'Philemon',
    'Titus',
    'Jakobus',
    'Philipper',
    'Kolosser',
    'Philemon',
    'Titus',
    'Hebraer',
    'Hebraer',
    '1. Petrus',
    '2. Johannes',
    '3. Johannes',

  ];

  List<String> displayData = [];

  @override
  void initState() {
    super.initState();
    displayData = List.from(traditionData); // initially show traditional
  }

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
      expandedIndex = null; // collapse all
      if (index == 0) {
        displayData = List.from(traditionData); // original order
      } else {
        displayData = List.from(traditionData)
          ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase())); // alphabetical
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Books',
                style: TextStyle(
                  color: Color(0xFF101010),
                  fontSize: 20,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, color: Color(0xff101010))),
            ],
          ),
          const SizedBox(height: 10),

          // Tabs
          Row(
            children: List.generate(
              tabsData.length,
                  (index) => Expanded(
                child: GestureDetector(
                  onTap: () => _onTabChange(index),
                  child: Column(
                    children: [
                      Text(
                        tabsData[index],
                        style: TextStyle(
                          color: _currentIndex == index
                              ? const Color(0xFF101010)
                              : const Color(0xFFA8A8A8),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                        height: 2,
                        color: _currentIndex == index
                            ? const Color(0xFFF3BD9C)
                            : Colors.transparent,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Book rows
          ...List.generate(displayData.length, (index) {
            final isExpanded = expandedIndex == index;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTradition(
                  context,
                  displayData[index],
                      () {
                    setState(() {
                      expandedIndex = expandedIndex == index ? null : index;
                    });
                  },
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                ),
                if (isExpanded) _buildChapterButtons()
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTradition(
      BuildContext context,
      String title,
      VoidCallback onTapArrow,
      IconData iconRequired,
      ) {
    return GestureDetector(
      onTap: onTapArrow,
      child: Container(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF292929),
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(iconRequired, color: const Color(0xFF101010)),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterButtons() {
    final chapters = ['1', '2', '3', '4', '5'];

    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: chapters.map((chapter) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: const Color(0x14F3BD9C),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFFFBEBE0),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  chapter,
                  style: const TextStyle(
                    color: Color(0xFF292929),
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
