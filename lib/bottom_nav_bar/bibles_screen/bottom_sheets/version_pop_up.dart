import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/bibles_screen/pop_up/remove_pop_up.dart';
import 'package:svg_flutter/svg.dart';

import '../../../widget/reusable_text_form.dart';

class VersionPopUp extends StatefulWidget {
  const VersionPopUp({super.key});

  @override
  State<VersionPopUp> createState() => _VersionPopUpState();
}

class _VersionPopUpState extends State<VersionPopUp> {
  int _currentIndex = 0;
  int? expandedIndex; // ✅ Track which row is expanded

  final List tabsData = ['All', 'Audio available'];
  final List<ContainerModel> versionData = [
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
    ContainerModel(
        videoWords: "HFA",
        title: "Biblica, Inc.",
        subTitle: "Hoffnung fur alle"),
  ];
  final List<ContainerTwoModel> versionOneData = [
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
    ContainerTwoModel(
      videoWords: "AMP",
      title: "Biblica, Inc.",
    ),
  ];
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return isActive
        ?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff101010),
                      )),
                  const Text(
                    '3.416 Versions in 2.228 Languages',
                    style: TextStyle(
                      color: const Color(0xFF101010),
                      fontSize: 20,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(Icons.close, color: Color(0xff101010)),
                ],
              ),
              const SizedBox(height: 10),
              ReusableTextForm(
                hintText: "Search...",
                borderColor: Colors.transparent,
                filledColor: const Color(0xF80EDEDED),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child:
                      SvgPicture.asset("assets/home_navigation/search 8.svg"),
                ),
                focusBorderColor: Colors.transparent,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    tabsData.length,
                    (index) => GestureDetector(
                      onTap: (){
                        setState(() {
                          _currentIndex=index;
                        });
                      },
                      child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.only(
                                top: 5, left: 8, right: 8, bottom: 6),
                            decoration: BoxDecoration(
                              color:_currentIndex==index?Color(0xFF664F42):Colors.transparent,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: _currentIndex==index?Colors.transparent: Color(0xFFA8A8A8))
                            ),
                        child: Center(
                          child: Text(
                          tabsData[index],
                            style: TextStyle(
                              color:_currentIndex==index? Color(0xFFF7D3BD): Color(0xFFA8A8A8),
                              fontSize: 14,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                          ),
                    )),
              ),
              const SizedBox(height: 10),
              ...List.generate(
                versionOneData.length,
                (index) => _buildContainerOne(
                    context,
                    versionOneData[index].videoWords,
                    versionOneData[index].title,
                    () {}),
              ),
            ],
          ):Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'My versions',
              style: TextStyle(
                color: const Color(0xFF101010),
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
        ReusableTextForm(
          hintText: "Search...",
          borderColor: Colors.transparent,
          filledColor: const Color(0xF80EDEDED),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child:
            SvgPicture.asset("assets/home_navigation/search 8.svg"),
          ),
          focusBorderColor: Colors.transparent,
        ),
        const SizedBox(height: 10),
        ...List.generate(
            versionData.length,
                (index) => _buildContainer(
                context,
                versionData[index].videoWords,
                versionData[index].title,
                versionData[index].subTitle, () {
              setState(() {
                isActive = !isActive;
              });
            }))
      ],
    );
  }

  Widget _buildContainer(
    BuildContext context,
    String videoWords,
    String title,
    String subTitle,
    VoidCallback onTapContainer,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTapContainer,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEDEDED),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        videoWords,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF292929),
                          fontSize: 14,
                          fontFamily: 'Quincy CF',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xFF737373),
                          fontSize: 12,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: const Color(0xFF101010),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          PopupMenuButton(
            padding: EdgeInsets.zero,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 30,
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(context: context, builder: (BuildContext context) { return RemovePopUp(); },);
                  },
                  child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xffC2B9B3),
                      child: Icon(Icons.close,color: Color(0xff664F42),),
                    ),

                    SizedBox(width: 10,),
                    Text(
                      'Remove form list',
                      style: TextStyle(
                        color: const Color(0xFF292929),
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                  ],
                )
                ),

              ];
            },
            offset: const Offset(0, 30),
            color: Colors.white,
            surfaceTintColor: Colors.white,
            icon:    Icon(
              Icons.more_horiz,
              color: Color(0xff101010),
            )
          ),

        ],
      ),
    );
  }

  Widget _buildContainerOne(
    BuildContext context,
    String videoWords,
    String title,
    VoidCallback onTapContainerOne,
  ) {
    return GestureDetector(
      onTap: onTapContainerOne,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: const Color(0xFFEDEDED),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Center(
                child: Text(
                  videoWords,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF292929),
                    fontSize: 14,
                    fontFamily: 'Quincy CF',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF101010),
                  fontSize: 14,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xff101010),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerModel {
  final String videoWords;
  final String title;
  final String subTitle;

  ContainerModel(
      {required this.videoWords, required this.title, required this.subTitle});
}

class ContainerTwoModel {
  final String videoWords;
  final String title;

  ContainerTwoModel({
    required this.videoWords,
    required this.title,
  });
}
