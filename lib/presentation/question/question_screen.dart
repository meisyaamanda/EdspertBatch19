import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersive_boothcamp/bloc/question_bloc/question_bloc.dart';
import 'package:immersive_boothcamp/data/services/course_remote_data.dart';
import '../../core/utils/theme.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionBloc(
        courseRemoteData: CourseRemoteData(),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Latihan Soal',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              if (state is QuestionSuccess) {
                final question = state.questionResponse.data;
                // Text();
               
              } 
               print('apa aja');
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
