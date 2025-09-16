import 'package:flutter/material.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _currentIndex = 0;

  final List tabsList = ['All activities', 'Bookmarks bible verses', 'Notes', 'Favorites'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFAEB),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFAEB),
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Color(0xFF101010),)),
        title: Text(
          'History',
          style: TextStyle(
            color: const Color(0xFF101010),
            fontSize: 20,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ==== TABS (unchanged) ====
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: List.generate(
                  tabsList.length,
                      (index) {
                    final sel = _currentIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => _currentIndex = index),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 6),
                        decoration: BoxDecoration(
                          color: sel ? const Color(0xFF664F42) : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: sel ? Colors.transparent : const Color(0xFFA8A8A8),
                          ),
                        ),
                        child: Text(
                          tabsList[index],
                          style: TextStyle(
                            color: sel ? const Color(0xFFF7D3BD) : const Color(0xFFA8A8A8),
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        SizedBox(height: 10,),
        _currentIndex==0?  Expanded(
          child: ListView(
            padding: EdgeInsets.only(top: 15),
            children: List.generate(10, (index)=> _buildHistory( 'How do we reconcile Jesus being both fully human and fully divine? What does this ',  '03.04.2025, 23:45', (){})),
          ),
        ):
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Spacer(),
                Image.asset("assets/learning_screen/Frame.png"),
                Text(
                  'Nothing to show',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF292929),
                    fontSize: 24,
                    fontFamily: 'Quincy CF',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.24,
                  ),
                ),
                SizedBox(height: 16,),
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
                SizedBox(height: 40,),
                Spacer(),


              ],
            ),
          ),
        ),


          ],
        ),
      ),
    );
  }

  Widget _buildHistory(String title,String subTitle, VoidCallback onTapMore){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                 title,
                  style: TextStyle(
                    color: const Color(0xFF292929),
                    fontSize: 14,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4,),
                Text(
                subTitle,
                  style: TextStyle(
                    color: const Color(0xFF737373),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Icon(Icons.more_vert,color: Color(0xffAD866F),)
        ],
      ),
    );

  }
}


