import 'package:cf_exam/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Krisha"),
              accountEmail: const Text("krisha123@gmail.com"),
              currentAccountPicture: CircleAvatar(
                foregroundImage: (Globals.image != null)
                    ? FileImage(Globals.image!) as ImageProvider
                    : const NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                      ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
          20.w,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'detail');
              },
              child: Container(
                height: size.height * 0.2,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff003152),
                ),
                child: const Center(
                  child: Text(
                    '+ Add Data',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            20.h,
            Column(
              children: [
                ...data.map(
                  (e) => Card(
                    color: const Color(0xff003152),
                    margin: const EdgeInsets.all(5),
                    surfaceTintColor: Colors.black,
                    child: ListTile(
                      leading: Text(
                        e.student_grid,
                        style: const TextStyle(color: Colors.white),
                      ),
                      title: Text(
                        e.student_name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        e.student_standard,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          data.remove(e);
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
