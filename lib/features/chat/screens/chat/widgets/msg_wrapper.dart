import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/chat/models/message.dart';
import 'package:hh_express/features/chat/screens/chat/widgets/msg_text.dart';
import 'package:hh_express/features/chat/screens/chat/widgets/msg_time.dart';
import 'package:hh_express/features/chat/screens/chat/widgets/ticks.dart';

class MessageWrapper extends StatelessWidget {
  const MessageWrapper({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final Message msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: msg.is_owner ? Colors.blue[400] : Colors.blue[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: msg.type == 'file'
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MessageText(msg: msg),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MessageTime(msg: msg),
                    if (msg.is_owner) ...[
                      const SizedBox(
                        width: 10,
                      ),
                      Ticks(msg: msg),
                    ]
                  ],
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MessageText(msg: msg),
                const SizedBox(
                  width: 10,
                ),
                MessageTime(msg: msg),
                if (msg.is_owner) ...[
                  const SizedBox(
                    width: 10,
                  ),
                  Ticks(msg: msg),
                ]
              ],
            ),
    );
  }
}
