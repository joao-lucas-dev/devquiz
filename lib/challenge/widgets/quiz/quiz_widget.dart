import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/asnwer/asnwer_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answers.length; i++)
            AsnwerWidget(
                answer: answer(i),
                disabled: indexSelelected != -1,
                isSelected: indexSelelected == i,
                onTap: (value) {
                  indexSelelected = i;

                  setState(() {});

                  Future.delayed(
                    Duration(seconds: 1),
                  ).then(
                    (_) => widget.onSelected(value),
                  );
                }),
        ],
      ),
    );
  }
}