import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/learn_details.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/learn_reading/learn_reading.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';
import 'package:timeline_tile/timeline_tile.dart';

class LearnExplaination extends StatefulWidget {
  const LearnExplaination({super.key});

  @override
  State<LearnExplaination> createState() => _LearnExplainationState();
}

class _LearnExplainationState extends State<LearnExplaination> {
  int _currentIndex=0;
  final List<DateModel> dateData=[
    DateModel(count: "1", date: "Mar 27"),
    DateModel(count: "1", date: "Mar 27"),
    DateModel(count: "1", date: "Mar 27"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFAEB),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFAEB),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Color(0xf08737373),
              child: Icon(Icons.arrow_back_rounded,color: Color(0xff101010),),
            ),
          ),
        ),
        title: Text(
          'James & Jude explained | mature faith, real wisdom',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF292929),
            fontSize: 20,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          SvgPicture.asset("assets/learning_screen/share.svg"),
          SizedBox(width: 10,)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        children: [
          Image.asset("assets/learning_screen/explain.png"),
          SizedBox(height: 24,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your progress',
                style: TextStyle(
                  color: const Color(0xFF737373),
                  fontSize: 16,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '67%',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFF101010),
                  fontSize: 16,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          LinearProgressBar(
            maxSteps: 100,
            progressType: LinearProgressBar.progressTypeLinear,
            // Use Linear progress
            currentStep: 80,
            progressColor: Color(0xFF00A251),
            backgroundColor: Color(0xFFEDEDED),
            borderRadius: BorderRadius.circular(10), //  NEW
          ),
          SizedBox(height: 8,),
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: ShapeDecoration(
                  color: const Color(0x28737373),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 7,
                  children: [
                    SvgPicture.asset("assets/learning_screen/calendar.svg"),
                    Text(
                      '5 Days',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFA8A8A8),
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: ShapeDecoration(
                  color: const Color(0x28737373),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 7,
                  children: [
                    SvgPicture.asset("assets/learning_screen/chair.svg"),
                    Text(
                      '30.573 Enrolled',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFA8A8A8),
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(dateData.length,(index)=> GestureDetector(
              onTap: (){
                setState(() {
                  _currentIndex=index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: EdgeInsets.only(right: 10),
                decoration: ShapeDecoration(
                  color:_currentIndex==index? Color(0xFFFEF8F5):Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: _currentIndex==index? Color(0xFFF3BD9C):Color(0xFFFEF8F5),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      dateData[index].count,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF292929),
                        fontSize: 20,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: ShapeDecoration(
                        color:_currentIndex==index? Color(0xFF664F42):Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Text(
                            dateData[index].date,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _currentIndex==index?Colors.white:Color(0xFF737373),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ),
          SizedBox(height: 24,),
          VerseTimeline(
            items: [
              VerseItem(
                title: 'James 5:16',
                subtitle: 'Therefore confess your sins to each other and pray for each other things a…',
              ),
              VerseItem(
                title: '1 John 5:14-15',
                subtitle: 'This is the confidence we have in approaching God: that if we ask anyth…',
              ),
              VerseItem(
                title: 'Jeremiah 33:3',
                subtitle: 'Call to me and I will answer you and tell you great and unsearchable things …',
              ),
            ],
            currentStep: _currentIndex,  // ← here
          ),
          SizedBox(height: 16,),
          CustomButton(onTap: (){},isRequiredArrow: false,title: "Start reading",),
          SizedBox(height: 16,),




        ],
      ),
    );
  }
}


class DateModel{
  final String count;
  final String date;
  DateModel({required this.count,required this.date});
}



class VerseItem {
  final String title;
  final String subtitle;
  const VerseItem({required this.title, required this.subtitle});
}

class VerseTimeline extends StatelessWidget {
  final List<VerseItem> items;
  final int currentStep;
  const VerseTimeline({
    super.key,
    required this.items,
    required this.currentStep,  // ← new param
  });

  @override
  Widget build(BuildContext context,) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 24),
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final isCompleted = index < currentStep;
        final isActive    = index == currentStep;

        final indicatorColor = (isCompleted || isActive)
            ? const Color(0xFF664F42)  // accent for done & active
            : Color(0xffFBEBE0);     // light circle for upcoming

        final beforeLineColor = (index <= currentStep)
            ? const Color(0xFF664F42)
            : Color(0xffFBEBE0);

        final afterLineColor = (index < currentStep)
            ? const Color(0xFF664F42)
            : Color(0xffFBEBE0);

        return TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.08,
          isFirst: index == 0,
          isLast:  index == items.length - 1,
          beforeLineStyle:  LineStyle(color: beforeLineColor, thickness: 2),
          afterLineStyle:   LineStyle(color: afterLineColor, thickness: 2),
          indicatorStyle: IndicatorStyle(
            width: 16,
            height: 16,
            color: indicatorColor,
            padding: const EdgeInsets.all(4),
            iconStyle: (isCompleted || isActive)
                ?  IconStyle(
              iconData: Icons.check,
              color: Colors.white,
            )
                : null,
          ),
          endChild: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 24),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration:
                    const Duration(milliseconds: 300),
                    pageBuilder:
                        (_, animation, secondaryAnimation) =>
                        LearnReading(),
                    transitionsBuilder: (_, animation, __, child) {
                      const begin = Offset(-1.0, 0.0); // from left
                      const end = Offset.zero;
                      final tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: Curves.easeOut));
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration:  (isCompleted || isActive)?ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFF3BD9C),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ):ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFFBEBE0),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].title,
                            style: const TextStyle(
                              color: const Color(0xFF292929),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            items[index].subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: const Color(0xFF737373),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Color(0xff101010)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
