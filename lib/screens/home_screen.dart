import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_zens/blocs/joke_bloc.dart';
import 'package:test_assignment_zens/blocs/joke_event.dart';
import 'package:test_assignment_zens/blocs/joke_state.dart';
import 'package:test_assignment_zens/models/joke.dart';
import 'package:test_assignment_zens/repositories/joke_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final JokeBloc _jokeBloc = JokeBloc(JokeRepository());
  int indexJoke = 0;

  @override
  void initState() {
    super.initState();
    _jokeBloc.add(JokeEventDelete());
    _jokeBloc.add(JokeEventSave(jokes));
    _jokeBloc.add(JokeEventGetJoke(indexJoke++));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _jokeBloc,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/left_icon.png'))),
                    ),
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Handicrafred by',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              'Jim HLS',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/right_icon.png'))),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              BlocBuilder<JokeBloc, JokeState>(builder: (context, state) {
                if (state is JokeStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is JokeStateLoaded) {
                  final joke = state.joke;
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromRGBO(41, 179, 99, 1),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                joke.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                joke.describe,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            joke.content,
                            style: const TextStyle(
                                fontSize: 17.0,
                                color: Color.fromRGBO(126, 126, 126, 1),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              joke.isFunny = true;
                              _jokeBloc.add(JokeEventUpdate(joke));
                              _jokeBloc.add(JokeEventGetJoke(indexJoke++));
                            },
                            child: Container(
                              width: 150,
                              color: const Color.fromRGBO(40, 115, 200, 1),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              child: const Text(
                                'This is Funny!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            onTap: () {
                              joke.isFunny = false;
                              _jokeBloc.add(JokeEventUpdate(joke));
                              _jokeBloc.add(JokeEventGetJoke(indexJoke++));
                            },
                            child: Container(
                              width: 150,
                              color: const Color.fromRGBO(41, 178, 99, 1),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              child: const Text(
                                'This is not Funny!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                } else if (state is JokeStateError) {
                  return Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromRGBO(41, 179, 99, 1),
                    child: const Center(
                      child: Text(
                        'That\'s all the jokes for today! Come back another day!"',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                } else {
                  return const Text('Lỗi không xác định');
                }
              }),
              const SizedBox(
                height: 50.0,
              ),
              Container(
                  height: 2.0, color: const Color.fromRGBO(243, 243, 243, 1)),
              const SizedBox(
                height: 5.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'This appis created as part of Hlsolutions program. The materials contained on this website are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromRGBO(150, 150, 150, 1)),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Copyright 2021 HLS',
                  style: TextStyle(
                      color: Color.fromRGBO(120, 120, 120, 1),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
