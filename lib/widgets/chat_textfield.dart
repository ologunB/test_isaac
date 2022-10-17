import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  final bool replying;
  final String replyingTo;
  final List<Widget> actions;
  final TextEditingController textController;
  final Color replyWidgetColor;
  final Color replyIconColor;
  final Color replyCloseColor;
  final Color messageBarColor;
  final Color sendButtonColor;
  final void Function(String)? onTextChanged;
  final void Function(String)? onSend;
  final void Function()? onTapCloseReply;

  ChatTextField({
    this.replying = false,
    this.replyingTo = "",
    this.actions = const [],
    this.replyWidgetColor = const Color(0xffF4F4F5),
    this.replyIconColor = Colors.blue,
    this.replyCloseColor = Colors.black12,
    this.messageBarColor = const Color(0xffF4F4F5),
    this.sendButtonColor = Colors.blue,
    this.onTextChanged,
    required this.textController,
    this.onSend,
    this.onTapCloseReply,
  });
  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          ...widget.actions,
          Expanded(
            child: Container(
              child: TextField(
                controller: widget.textController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                minLines: 1,
                maxLines: 3,
                onChanged: (a) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Type your message here",
                  hintMaxLines: 1,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Colors.black26,
                      width: 0.2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Colors.black26,
                      width: 0.2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: Colors.black26,
                      width: 0.2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.textController.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: widget.sendButtonColor,
                  size: 24,
                ),
                onPressed: () {
                  if (widget.textController.text.trim() != '') {
                    if (widget.onSend != null) {
                      widget.onSend!(widget.textController.text.trim());
                    }
                    widget.textController.text = '';
                    setState(() {});
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
