import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/chat_main/pop_ups/relationshiop_pop_up.dart';
import 'package:my_cristianity_app/bottom_nav_bar/home_screen/setting_screen.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ChatMain extends StatefulWidget {
  const ChatMain({super.key});

  @override
  State<ChatMain> createState() => _ChatMainState();
}

class _ChatMainState extends State<ChatMain> {
  final List _tabsData = ['Ask anything', 'Talk to Pastor', 'Own prayer'];
  int _currentIndex = 0;

  final List<DiscoverModel> discoveryList=[
    DiscoverModel(imagePath: "assets/chat_main/image.png", title:     'Heroes of Faith',),
    DiscoverModel(imagePath: "assets/chat_main/image (1).png", title:     'Path to Purity',),
    DiscoverModel(imagePath: "assets/chat_main/Rectangle 1176 (1).png", title:     'Heroes of Faith',)
  ];
  final List<DiscoverModel> thinkList=[
    DiscoverModel(imagePath: "assets/chat_main/family-is-gathered-around-table-with-pumpkin-family-people-background_369680169.htm_log-in=google.png", title:     'Thanksgiving and\nworship',),
    DiscoverModel(imagePath: "assets/chat_main/2.png", title:     'Thankfulness for\ncommunity and family',),
    DiscoverModel(imagePath: "assets/chat_main/family-is-gathered-around-table-with-pumpkin-family-people-background_369680169.htm_log-in=google.png", title:     'Thanksgiving and\nworship',),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/chat_main/chat.png"))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only( left: 15, right: 15),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '“God is our refuge and strength, A very present help in trouble.”',
                        style: TextStyle(
                          color: const Color(0xFF866856),
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Psalm 46:1',
                        style: TextStyle(
                          color: const Color(0xFF664F42),
                          fontSize: 14,
                          fontFamily: 'Quincy CF',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.14,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xFFFEF8F5),
                              child: SvgPicture.asset(
                                "assets/onboarding_screen/share.svg",
                                color: Color(0xffAD866F),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFEF8F5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Help me understand',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFFAD866F),
                                    fontSize: 14,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.42,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only( left: 15, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    _tabsData.length,
                    (index) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 13),
                          margin: EdgeInsets.only(right: 10),
                          decoration: ShapeDecoration(
                            color: _currentIndex == index
                                ? const Color(0xFF664F42)
                                : Color(0xFFFEF8F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(120),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _tabsData[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: _currentIndex == index
                                    ? Colors.white
                                    : Color(0xFF664F42),
                                fontSize: 15,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.48,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: const Color(0x14FFCF5F),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFFFE9B5),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/chat_main/apps.svg"),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Add a widget for daily bible',
                                style: TextStyle(
                                  color: const Color(0xFF6B5728),
                                  fontSize: 16,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Customize your home screen with daily Bible verses form settings',
                                style: TextStyle(
                                  color: const Color(0xFF6B5728),
                                  fontSize: 12,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  height: 1.20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(

                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'See how to add',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color(0xFF664F42),
                                        fontSize: 14,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                        height: 1.14,
                                        letterSpacing: -0.42,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: const Color(0xFF664F42),
                                      size: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.close,
                          color: Color(0xff101010),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'I want to ask about...',
                style: TextStyle(
                  color: const Color(0xFF101010),
                  fontSize: 20,
                  fontFamily: 'Quincy CF',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFBEBE0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)),
                              child: Image.asset(
                                  fit: BoxFit.cover,
                                  "assets/chat_main/Frame.png")),

                          Positioned(
                            bottom: 10,
                            right: 5,

                            child:        Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Prayer',
                                  style: TextStyle(
                                    color: const Color(0xFF101010),
                                    fontSize: 14,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xff101010),
                                )
                              ],
                            ),


                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return Padding(
                              padding: MediaQuery.of(context)
                                  .viewInsets, // 👈 handles keyboard correctly
                              child: SingleChildScrollView(
                                child: RelationshipPopUp(), // 👈 your custom content
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBEBE0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16)),
                                child: Image.asset(
                                    fit: BoxFit.cover,
                                    "assets/chat_main/Layer_3.png")),

                            Positioned(
                                bottom: 10,
                                right: 5,

                                child:        Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Relationship',
                                      style: TextStyle(
                                        color: const Color(0xFF101010),
                                        fontSize: 14,
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xff101010),
                                    )
                                  ],
                                ),


                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text(
                'Discover',
                style: TextStyle(
                  color: const Color(0xFF101010),
                  fontSize: 20,
                  fontFamily: 'Quincy CF',
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 12,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(discoveryList.length, (index)=> Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(discoveryList[index].imagePath),
                        SizedBox(height: 10,),
                        Text(
                      discoveryList[index].title,
                          style: TextStyle(
                            color: const Color(0xFF101010),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],),
                  )),
                ),
              ),
              SizedBox(height: 12,),
              Text(
                'Thanksgiving Season',
                style: TextStyle(
                  color: const Color(0xFF101010),
                  fontSize: 20,
                  fontFamily: 'Quincy CF',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(thinkList.length, (index)=> Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(thinkList[index].imagePath),
                        SizedBox(height: 10,),
                        Text(
                          thinkList[index].title,
                          style: TextStyle(
                            color: const Color(0xFF101010),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],),
                  )),
                ),
              ),
              SizedBox(height: 12,),

            ],
          ),
        )
      ],
    );
  }
}


class DiscoverModel{
  String imagePath;
  String title;
  DiscoverModel({required this.imagePath,required this.title});
}