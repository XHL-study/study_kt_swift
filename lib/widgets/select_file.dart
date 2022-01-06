import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

typedef OnSelected = void Function(File file);

class SelectFile extends StatefulWidget {
  final OnSelected onSelected;
  const SelectFile(this.onSelected, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SelectFileState();
  }
}

class SelectFileState extends State<SelectFile> {
  void openSelectFileWindow() async {
    final fileResult = await FilePicker.platform.pickFiles();
    if (fileResult != null && fileResult.paths.first != null) {
      final path = fileResult.paths.first;
      widget.onSelected(File(path!));
    }
  }

  Widget get selectButton {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton.icon(
        label: const Text('点击选择文件'),
        icon: const Icon(Icons.folder),
        onPressed: openSelectFileWindow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      selectButton,
    ]);
  }
}
