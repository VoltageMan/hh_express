
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/chat/bloc/chat_bloc.dart';
import 'package:hh_express/features/chat/bloc/chat_events.dart';
import 'package:image_picker/image_picker.dart';

class TypeAndSend extends StatefulWidget {
  const TypeAndSend({
    Key? key,
  }) : super(key: key);

  @override
  State<TypeAndSend> createState() => _TypeAndSendState();
}

class _TypeAndSendState extends State<TypeAndSend> {
  bool isTextEmpty = true;
  bool isVoice = true;

  final TextEditingController _text = TextEditingController();

  void changeValue(String v) {
    setState(() {
      isTextEmpty = v.isEmpty;
    });
  }

  Future<void> showCameraOrGallerySelector() async {
    final bloc = BlocProvider.of<ChatBloc>(context);
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              20,
            ),
          ),
        ),
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  padding: EdgeInsets.all(5.sp),
                  child: IconButton(
                    onPressed: () async {
                      Navigator.of(ctx).pop();
                      final image = await ImagePicker().pickImage(
                          source: ImageSource.camera, imageQuality: 50);
                      if (image != null) {
                        bloc.add(
                          SendMessageEvent(
                            file: image,
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.camera_outlined,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  child: VerticalDivider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  padding: EdgeInsets.all(5.sp),
                  child: IconButton(
                    onPressed: () async {
                      Navigator.of(ctx).pop();
                      final image = await ImagePicker().pickImage(
                          source: ImageSource.gallery, imageQuality: 50);
                      if (image != null) {
                        bloc.add(
                          SendMessageEvent(
                            file: image,
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.image_outlined,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ChatBloc>(context);
    return BottomAppBar(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: TextField(
              controller: _text,
              decoration: const InputDecoration(
                hintText: "Type a message...",
                border: InputBorder.none,
              ),
              onChanged: changeValue,
            ),
          ),
          IconButton(
            onPressed: () async {
              showCameraOrGallerySelector();
            },
            icon: const Icon(
              Icons.attach_file,
            ),
          ),
          IconButton(
            onPressed: () {
              bloc.add(
                SendMessageEvent(
                  message: _text.text,
                ),
              );
              _text.clear();
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
