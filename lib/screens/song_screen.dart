import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_dem/utility/converter.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  // double seekValue = 0;
  Rx<Duration> position = Duration.zero.obs;
  Rx<Duration> duration = const Duration(minutes: 5).obs;
  RxBool isPlaying = false.obs;

  RxBool isFilled = false.obs;

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Songs'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/music.png',
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[0]['first'],
                          style: const TextStyle(fontSize: 22),
                        ),
                        Text(
                          data[1]['second'],
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    return IconButton(
                        onPressed: () {
                          isFilled.value = !isFilled.value;
                          setState(() {});
                        },
                        icon: isFilled.value
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_outline, color: Colors.white)

                        /*Icon(
                        isFilled.value
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.red,
                        size: 30,
                      ),*/
                        );
                  }),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white.withOpacity(0.5),
                      value: MyConverter.getPosition(
                          position.value, duration.value),
                      onChanged: (v) {
                        //seekValue = v;
                        position.value = Duration(
                            seconds: (v * duration.value.inSeconds).toInt());
                        // setState(() {});
                      });
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(MyConverter.durationToText(position.value)),
                      Text(MyConverter.durationToText(duration.value))
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: 35.0,
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ),
                ),
                Obx(() {
                  return IconButton(
                    onPressed: () {
                      isPlaying.value = !isPlaying.value;
                      // setState(() {});
                    },
                    iconSize: 60.0,
                    icon: Icon(
                      isPlaying.value ? Icons.pause_circle : Icons.play_circle,
                      size: 60,
                      color: Colors.white,
                    ),
                  );
                }),
                IconButton(
                  onPressed: () {},
                  iconSize: 35.0,
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
