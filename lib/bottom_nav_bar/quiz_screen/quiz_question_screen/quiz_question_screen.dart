import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class QuizQuestionScreen extends StatefulWidget {
  final List<Question> questions;
  final int level;

  const QuizQuestionScreen({
    Key? key,
    required this.questions,
    this.level = 1,
  }) : super(key: key);

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  int _current = 0;
  int _selected = -1;
  bool _answered = false;

  void _selectOption(int idx) {
    if (_answered) return;
    setState(() {
      _selected = idx;
      _answered = true;
    });
  }

  void _tryAgain() {
    setState(() {
      _answered = false;
      _selected = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[_current];
    final isCorrect = _selected == q.correctIndex;
    return Scaffold(
      backgroundColor: Color(0xffF9E1D1),
      body: Padding(
        padding: EdgeInsets.only(top: (MediaQuery.of(context).padding.top)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  // back arrow
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const Icon(Icons.arrow_back, size: 28),
                  ),
                  const Spacer(),
                  // progress circle
                  // new: using percent_indicator
                  CircularPercentIndicator(
                    radius: 33,
                    lineWidth: 4,
                    percent: (_current + 1) / widget.questions.length,
                    backgroundColor: const Color(0xFF664F42),
                    progressColor: Colors.white,
                    center: CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xFF664F42) ,
                      child: Text(
                        '${_current + 1}/${widget.questions.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),


                  const Spacer(),
                  // level badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 128),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:

                    Text(
                      'Level ${widget.level}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFE5E5E5),
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // white panel
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all( Radius.circular(24),),
              ),
              child: _answered
                  ? _buildFeedback(q, isCorrect)
                  : _buildQuestion(q),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(Question q) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // question text
        Text(
          q.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: const Color(0xFF664F42),
            fontSize: 20,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        // options
        ...List.generate(q.options.length, (i) {
          return _OptionTile(
            label: String.fromCharCode(65 + i),
            text: q.options[i],
            onTap: () => _selectOption(i),
          );
        }),
      ],
    );
  }

  Widget _buildFeedback(Question q, bool correct) {
    final accentColor = correct ? const Color(0xFF31B654) :
    const Color(0xFFE34E47);
    return Column(
      children: [
        Icon(
          correct ? Icons.check_circle : Icons.cancel,
          size: 30,
          color: accentColor,
        ),
        const SizedBox(height: 16),
        Text(
          correct
              ? "You’re correct"
              : "Unfortunately, the answer is incorrect.\nPlease feel free to try again!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: accentColor,
            fontSize: 16,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
        ),
        if (!correct) ...[
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _tryAgain,
            child: Container(
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                color: const Color(0xFFFBEBE0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(120),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                Icon(Icons.refresh, size: 18),

                  Text(
                    'Try again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF664F42),
                      fontSize: 14,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.42,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 24),
        // show options again with coloring
        ...List.generate(q.options.length, (i) {
          Color? bg;
          Color textColor = const Color(0xFF5A4632);
          if (i == _selected) {
            bg = accentColor;
            textColor = Colors.white;
          }
          return _OptionTile(
            label: String.fromCharCode(65 + i),
            text: q.options[i],
            backgroundColor: bg,
            textColor: textColor,
            onTap: null,
          );
        }),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String label, text;
  final VoidCallback? onTap;
  final Color? backgroundColor, textColor;

  const _OptionTile({
    Key? key,
    required this.label,
    required this.text,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = backgroundColor == null
        ? Border.all(color: const Color(0xFFFBEBE0))
        : null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          border: border,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: textColor ?? const Color(0xFF292929),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,

              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor ?? const Color(0xFF5A4632),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// sample data model

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;
  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

const sampleQuestions = [
  Question(
    text: 'The first book of the Bible is called what?',
    options: ['Leviticus', 'Mathew', 'Genesis', 'Revelation'],
    correctIndex: 2, // Genesis
  ),
  // add more questions here...
];
