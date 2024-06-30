import 'package:flutter/material.dart';
import 'package:notes_app/data/data.dart';
import 'package:notes_app/pages/image_opening.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Contacts> data_1 = contacts;
  final TextEditingController control = TextEditingController();
  late bool f;
  @override
  void initState() {
    super.initState();
    f = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          f = !f;
        });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Home Page",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        f = !f;
                      });
                    },
                    controller: control,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    onChanged: searching,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              f == true
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: data_1.length,
                      itemBuilder: (context, index) {
                        final show = data_1[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ImageOpening(
                                    name_1: show.name,
                                    image_1: show.image,
                                  );
                                },
                              ),
                            );
                          },
                          child: ListTile(
                            shape: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            tileColor: Colors.white,
                            title: Text(show.name),
                            leading: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        content: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(show.image)),
                                      );
                                    });
                              },
                              child: Hero(
                                tag: show.image,
                                child: CircleAvatar(
                                  radius: 22,
                                  child: ClipOval(
                                    child: Image.asset(
                                      show.image,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  void searching(String query) {
    final suggestions = data_1.where((data_2) {
      final val = data_2.name.toLowerCase();
      final que = query.toLowerCase();
      return val.contains(que);
    }).toList();
    setState(() {
      query.isEmpty ? data_1 = contacts : data_1 = suggestions;
    });
  }
}
