import 'dart:io';

import 'package:digicapp/control/val/val_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'ftp_panel.dart';

class btn_image_dialog_me extends StatefulWidget {
  final String patch_;
  final String name_file;
  final String label_dialog;
  final Widget child_;

  const btn_image_dialog_me({
    Key? key,
    required this.patch_,
    required this.name_file,
    required this.label_dialog,
    required this.child_,
  }) : super(key: key);
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<btn_image_dialog_me> {
  XFile? _image;

  Future<void> _selectPhotoFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  Future<void> _selectPhotoFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }
  Future<void> _uploadToFTP() async {
    if (_image != null) {
      try {
        await ftp.connect();

        final newFileName = "${widget.name_file}.jpg"; // Provide the new file name here
        final file = File(_image!.path);
        final renamedFile = await file.rename("${file.parent.path}/$newFileName");
        await ftp.uploadFile(
          renamedFile,
          sRemoteName: "${widget.patch_}/$newFileName",
        );
        print("Upload successful");
      } catch (e) {
        print("Upload failed: $e");
      } finally {
        ftp.disconnect();
      }
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: widget.child_,
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text("${widget.label_dialog}"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _image != null
                            ? Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(_image!.path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.photo_library),
                              onPressed: () {
                                _selectPhotoFromGallery().then((_) {
                                  setState(() {});
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                _selectPhotoFromCamera().then((_) {
                                  setState(() {});
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Select Picture"),
                        onPressed: () {
                          _uploadToFTP();
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        });
  }
}

class btn_select_image extends StatefulWidget {
  final String patch_;
  final int Type_image;
  final String name_file;
  final String label_dialog;
  final Widget child_;

  const btn_select_image({
    Key? key,
    required this.patch_,
    required this.name_file,
    required this.label_dialog,
    required this.child_,
    required this.Type_image,
  }) : super(key: key);
  @override
  btn_select_imageState createState() => btn_select_imageState();
}

class btn_select_imageState extends State<btn_select_image> {
  XFile? _image;

  Future<void> _selectPhotoFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  Future<void> _selectPhotoFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: widget.child_,
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text("${widget.label_dialog}"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _image != null
                            ? Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(_image!.path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.photo_library),
                              onPressed: () {
                                _selectPhotoFromGallery().then((_) {
                                  setState(() {});
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                _selectPhotoFromCamera().then((_) {
                                  setState(() {});
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Select Picture"),
                        onPressed: () async {
                          final newFileName = "${widget.name_file}.jpg"; // Provide the new file name here
                          final file = File(_image!.path);

                          setState(() {
                            list_image_send_ftp[widget.Type_image]['file'] = file;
                            list_image_send_ftp[widget.Type_image]['newFileName'] = newFileName;
                            list_image_send_ftp[widget.Type_image]['Type'] = "1";
                            list_image_send_ftp[widget.Type_image]['sRemoteName'] = "${widget.patch_}/$newFileName";
                            list_image_send_ftp[widget.Type_image]['imageview'] = FileImage(File(_image!.path));
                          });
                          print(list_image_send_ftp);
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        });
  }
}
