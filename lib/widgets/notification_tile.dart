import 'package:flutter/material.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.leadingIcon});
  final String title;
  final String subTitle;
  final Icon leadingIcon;

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.leadingIcon,
      title: Text(widget.title),
      subtitle: Text(widget.subTitle),
    );
  }
}
