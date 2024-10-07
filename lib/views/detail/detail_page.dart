import 'dart:io';

import 'package:cf_exam/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/models.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 400,
                alignment: Alignment.center,
                child: Stack(
                  alignment: const Alignment(0.8, 0.9),
                  children: [
                    CircleAvatar(
                      radius: s.height * 0.15,
                      foregroundImage: (Globals.image != null)
                          ? FileImage(Globals.image!) as ImageProvider
                          : const NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                            ),
                    ),
                    // image
                    FloatingActionButton.extended(
                      onPressed: () async {
                        ImagePicker picker = ImagePicker();
                        XFile? xFile =
                            await picker.pickImage(source: ImageSource.gallery);
                        Globals.image = File(xFile!.path);
                        setState(() {});
                      },
                      backgroundColor: const Color(0xff003152),
                      label: const Icon(
                        Icons.camera_alt,
                        weight: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: GlobalModel.formKey,
                child: SingleChildScrollView(
                  child: Expanded(
                    child: Column(
                      children: [
                        20.h,
                        TextFormField(
                          onSaved: (value) {
                            GlobalModel.student_name = value!;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            hintText: 'Enter Your Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        20.h,
                        TextFormField(
                          onSaved: (value) {
                            GlobalModel.student_grid = value!;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'GRID',
                            hintText: 'Enter Your GRID',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your grid';
                            }
                            return null;
                          },
                        ),
                        20.h,
                        TextFormField(
                          onSaved: (value) {
                            GlobalModel.student_standard = value!;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'STD',
                            hintText: 'Enter Your STD',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your standard';
                            }
                            return null;
                          },
                        ),
                        20.h,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (GlobalModel.formKey.currentState!
                                    .validate()) {
                                  GlobalModel.formKey.currentState!.save();
                                }
                                data.add(Globals(
                                  student_name: GlobalModel.student_name,
                                  student_grid: GlobalModel.student_grid,
                                  student_standard:
                                      GlobalModel.student_standard,
                                  student_image: Globals.image,
                                ));
                              },
                              child: const Text('Save'),
                            ),
                            70.w,
                            ElevatedButton(
                              onPressed: () {
                                GlobalModel.formKey.currentState!.reset();
                                GlobalModel.student_image == null;
                                setState(() {});
                              },
                              child: const Text('Reset'),
                            ),
                          ],
                        ),
                        20.h,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
