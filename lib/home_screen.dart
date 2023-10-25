import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool pressed = false;
  CardController controller = CardController();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(microseconds: 800));
  }
  Alignment align = Alignment(0, 0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tinder by Rutvik'),
        ),
        body: Center(
          child: _showPrefListData(size, controller),
        ),
      ),
    );
  }

  _showPrefListData(Size size, CardController cardController) {
    double height = pressed ? 750 : 600;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: height,
              child: SwipeCard(
                swipeEdgeVertical: 8.0,
                animDuration: 500,
                totalNum: imageItems.length,
                stackNum: 3,
                swipeEdge: 2.0,
                allowVerticalMovement: false,
                maxWidth: MediaQuery.of(context).size.width * 1,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width + 120 * 0.88,
                maxHeight: MediaQuery.of(context).size.width + 200 * 3,
                cardBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: FadeInImage(
                                      fit: BoxFit.cover,
                                      height: pressed
                                          ? MediaQuery.of(context).size.height *
                                              0.9
                                          : MediaQuery.of(context).size.height *
                                              0.9,
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      image: NetworkImage(
                                        imageItems[index]['image'],
                                      ),
                                      placeholder: NetworkImage(
                                        imageItems[index]['image'],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: pressed ? 700 : 542,
                                    left: 310,
                                    child: CircleAvatar(
                                        child: IconButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            pressed = !pressed;
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_upward,
                                        weight: 200,
                                      ),
                                    )),
                                  ),
                                  
                          Align(
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: ConfettiWidget(
                                        confettiController: _confettiController,
                                        blastDirection: pi / 2,
                                        emissionFrequency: 0.2,
                                        numberOfParticles: 100,
                                        blastDirectionality:
                                            BlastDirectionality.explosive,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              pressed
                                  ? Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: double.infinity,
                                        // height: pressed? size.height * 0.2:600 ,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          color: Colors.white,
                                          gradient: LinearGradient(
                                              colors: [
                                                Colors.red,
                                                Colors.yellow,
                                              ],
                                              begin: FractionalOffset(1.0, 0.0),
                                              end: FractionalOffset(0.0, 1.0),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                // Kylie Jean | Age 25
                                                pressed
                                                    ? Text(
                                                        "${imageItems[index]['Name']}",
                                                        style: TextStyle(
                                                            color: const Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize:
                                                                size.width *
                                                                    0.07),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left)
                                                    : const Text(''),
                                                pressed
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          '${imageItems[index]['Profession']}',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xffffffff),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize:
                                                                  size.width *
                                                                      0.04),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    : const Text(''),

                                                pressed
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          '${imageItems[index]['Description']} ',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xffffffff),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize:
                                                                  size.width *
                                                                      0.04),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    : const Text(''),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),

                              const SizedBox(
                                height: 20,
                              ),
                              // second
                              pressed
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: FadeInImage(
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        image: NetworkImage(
                                          imageItems[index]['image'],
                                        ),
                                        placeholder: NetworkImage(
                                          imageItems[index]['image'],
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              const SizedBox(
                                height: 12,
                              ),
                              pressed
                                  ? Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          color: Colors.white,
                                          gradient: LinearGradient(
                                              colors: [
                                                Colors.red,
                                                Colors.yellow,
                                              ],
                                              begin: FractionalOffset(1.0, 0.0),
                                              end: FractionalOffset(0.0, 1.0),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                pressed
                                                    ? Text(
                                                        '${imageItems[index]['Name']}',
                                                        style: TextStyle(
                                                            color: const Color(
                                                                0xffffffff),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize:
                                                                size.width *
                                                                    0.07),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left)
                                                    : const Text(''),
                                                pressed
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          '${imageItems[index]['Profession']}',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xffffffff),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize:
                                                                  size.width *
                                                                      0.04),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    : const Text(''),
                                                pressed
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          '${imageItems[index]['Description']}',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xffffffff),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize:
                                                                  size.width *
                                                                      0.04),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    : const Text(''),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                cardController: cardController,
                swipeUpdateCallback:
                    (DragUpdateDetails details, Alignment align) {
                  /// Get swiping card's alignment
                  if (align.x < 0) {
                    //Card is LEFT swiping
                    _confettiController.play( );

                  } else if (align.x > 0) {
                    //Card is RIGHT swiping
                    // Fluttertoast.showToast(msg: 'Likeed it ' );
                    _confettiController.play();

                  }
                },
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  if (orientation == CardSwipeOrientation.RIGHT) {}
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<dynamic> imageItems = [
    {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Omkar',
      'Profession': 'Coder',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Rutvik',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696172686863-f47aac202464?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Ajay',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1697325705661-8c3b01d90eb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Ravi',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Nilesh',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Deepak',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Ajay',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Django Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Chanduu',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Ram',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am PHP Developer and currently i am working on The  Synkrama Technology'
    },
       {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Omkar',
      'Profession': 'Coder',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Rutvik',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696172686863-f47aac202464?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Ajay',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1697325705661-8c3b01d90eb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Ravi',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Nilesh',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Deepak',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Ajay',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Django Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Chanduu',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Ram',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am PHP Developer and currently i am working on The  Synkrama Technology'
    },
       {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Omkar',
      'Profession': 'Coder',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Rutvik',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696172686863-f47aac202464?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Ajay',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1697325705661-8c3b01d90eb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Ravi',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Nilesh',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Deepak',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Ajay',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Django Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Chanduu',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Ram',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am PHP Developer and currently i am working on The  Synkrama Technology'
    },
       {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Omkar',
      'Profession': 'Coder',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Rutvik',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696172686863-f47aac202464?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Ajay',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Flutter Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1697325705661-8c3b01d90eb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Ravi',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      "image":
          'https://images.unsplash.com/photo-1696635101677-eae56a4a896c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'Name': 'Nilesh',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Deepak',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Ajay',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am Django Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Chanduu',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am React Developer and currently i am working on The  Synkrama Technology'
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1666277012297-68ef822aa1ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
      'Name': 'Ram',
      'Profession': 'Coder/Programmer',
      'Description':
          'I am PHP Developer and currently i am working on The  Synkrama Technology'
    }
  ];
}

List<dynamic> nameList = [
  'Omkar',
  'Rutvik',
  'Ajay',
  'Nilesh',
  'Ravi',
  'Vishwnath',
  'Rajesh',
  'Deepak',
  'priya'
];
