import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cristianity_app/bottom_nav_bar/learn_screen/bottom_sheets/notification_off.dart';
import 'package:my_cristianity_app/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';
import '../../../widget/reusable_text_form.dart';

class StartPlanBottomSheet extends StatefulWidget {
  const StartPlanBottomSheet({super.key});

  @override
  _StartPlanBottomSheetState createState() => _StartPlanBottomSheetState();
}

class _StartPlanBottomSheetState extends State<StartPlanBottomSheet> {
  // initial time (10:00)
  DateTime _selectedTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    10,
    0,
  );

  void _showTimePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            // Done button
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text('Done'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            // The wheel picker
            SizedBox(
              height: 250,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                use24hFormat: true,
                minuteInterval: 1,
                initialDateTime: _selectedTime,
                onDateTimeChanged: (DateTime newTime) {
                  setState(() {
                    _selectedTime = newTime;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _timeLabel {
    final h = _selectedTime.hour.toString().padLeft(2, '0');
    final m = _selectedTime.minute.toString().padLeft(2, '0');
    return '$h : $m';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          // Close icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child:
                const Icon(Icons.close, color: Color(0xff101010)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Image.asset("assets/learning_screen/_Empty state.png"),
          const SizedBox(height: 10),
          const Text(
            'Journey through salvation history',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF292929),
              fontSize: 24,
              fontFamily: 'Quincy CF',
              fontWeight: FontWeight.w500,
              letterSpacing: -0.24,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'To continue growing in your faith, set a \nreminder for your Study Plan',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF737373),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.watch_later_outlined,
                color: Color(0xff101010),
              ),
              const SizedBox(width: 10),
              const Text(
                'Set time',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF664F42),
                  fontSize: 16,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              // tappable time label
              InkWell(
                onTap: _showTimePicker,
                borderRadius: BorderRadius.circular(120),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF9E1D1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(120),
                    ),
                  ),
                  child: Text(
                    _timeLabel,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF664F42),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomButton(
            onTap: () {
              Navigator.pop(context);
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
                    padding:
                    MediaQuery.of(context).viewInsets,
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height *
                            0.85,
                        child: const NotificationOffBottomSheet(),
                      ),
                    ),
                  );
                },
              );
            },
            title: "Update reminder",
            isRequiredArrow: false,
          ),
        ],
      ),
    );
  }
}
