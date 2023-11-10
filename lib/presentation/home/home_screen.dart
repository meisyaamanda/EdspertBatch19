import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersive_boothcamp/bloc/banner_bloc/banner_bloc.dart';
import 'package:immersive_boothcamp/bloc/course_bloc/course_bloc.dart';
import 'package:immersive_boothcamp/presentation/course/course_screen.dart';
import 'package:immersive_boothcamp/presentation/home/banner_list.dart';
import 'package:immersive_boothcamp/presentation/course/course_list.dart';
import 'package:immersive_boothcamp/data/services/banner_remote_data_service.dart';
import 'package:immersive_boothcamp/core/utils/theme.dart';
import '../../data/services/course_remote_data.dart';

enum BannerStatus { initial, loading, success, error }

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final courseBloc = CourseBloc(
    courseRemoteData: CourseRemoteData(),
  );

  final bannerRemoteData = BannerRemoteData();

  final courseRemotData = CourseRemoteData();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BannerBloc(
            bannerRemoteData: BannerRemoteData(),
          )..add(
              GetBannerListEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => courseBloc..add(
              GetCourseListEvent(),
            ),
        ),
      ],
      child: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hai, Altop',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Selamat Datang',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 17,
                        backgroundImage: AssetImage('assets/edo_selfie.png'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 147,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff3A7FD5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mau kerjain\nlatihan soal\napa hari ini?',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset('assets/banner.png')),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pilih Pelajaran',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CourseScreen(courseBloc: courseBloc),
                                  ),
                                );
                              },
                              child: const Text(
                                'Lihat Semua',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(
                                      0xFF3A7FD5,
                                    )),
                              ))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseFailed) {
                        return Center(
                          child: Text(state.message ?? ''),
                        );
                      } else if (state is CourseSuccess) {
                        return CourseListWidget(
                            courseList: state.courseResponse.data ?? []);
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  Text(
                    'Terbaru',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  BlocBuilder<BannerBloc, BannerState>(
                    builder: (context, state) {
                      if (state is BannerFailed) {
                        return Center(
                          child: Text(state.message ?? ''),
                        );
                      } else if (state is BannerSuccess) {
                        return BannerListWidget(
                          bannerList: state.bannerResponse.data ?? [],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
