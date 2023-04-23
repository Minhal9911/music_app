import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_dem/models/model.dart';
import 'package:get_dem/services/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Entry> entries = [];
  RxBool isLoading = false.obs;

  void _fetchSongs() async {
    isLoading.value = true;
    /* setState(() {
      isLoading = true;
    });*/
    var response = await Service.fetchItem();
    entries = response.entries;
    isLoading.value = false;
    /*setState(() {
      isLoading = false;
    });*/
  }

  @override
  void initState() {
    _fetchSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          title: const Text('Music List'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: const Drawer(
          backgroundColor: Colors.deepPurple,
        ),
        body: Obx(() {
          return isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/music.png'),
                      ),
                      title: Text(entries[index].api),
                      subtitle: Text(entries[index].description),
                      trailing: PopupMenuButton(
                        color: Colors.deepPurple,
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: '1',
                              child: const Text(
                                'Play later',
                              ),
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              value: '2',
                              child: const Text(
                                'Add to queue',
                              ),
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              value: '3',
                              child: const Text(
                                'Add to playlist',
                              ),
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              value: '4',
                              child: const Text(
                                'Delete',
                              ),
                              onTap: () {},
                            ),
                            PopupMenuItem(
                              value: '5',
                              child: const Text(
                                'Share',
                              ),
                              onTap: () {},
                            ),
                          ];
                        },
                      ),
                      onTap: () {
                        Get.toNamed("/song", arguments: [
                          {'first': entries[index].api},
                          {'second': entries[index].description}
                        ]);
                      },
                    );
                  },
                );
        }),
      ),
    );
  }
}
