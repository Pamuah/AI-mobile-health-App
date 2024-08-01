import 'package:ai_mhealth_app/models/chat_controller.dart';
import 'package:ai_mhealth_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';
import '../widgets/appbar.dart';
import 'package:intl/intl.dart';

class DoctorScreen extends StatefulWidget {
  static const routeName = '/doctor';
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  TextEditingController msgInputController = TextEditingController();
  late IO.Socket socket;
  ChatController chatController = ChatController();

  void sendMessage(String text) {
    var messageJson = {'message': text, 'sentByMe': socket.id};
    print('Sending message: $messageJson'); // Added logging
    socket.emit('message', messageJson);
    chatController.chatMessages.add(Message.fromJson(messageJson));
  }

  void setUpSocketListener() {
    socket.on("message-receive", (data) {
      print('Message received: $data'); // Added logging
      chatController.chatMessages.add(Message.fromJson(data));
    });
    socket.on("connect-user", (data) {
      print(data);
      chatController.connnectedUser.value = data;
    });
  }

  @override
  void initState() {
    super.initState();
    socket = IO.io(
        'http://100.112.16.95:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
    setUpSocketListener();
    socket.on('connect', (_) {
      print('Connected to server: ${socket.id}'); // Added logging
    });
    socket.on('connect_error', (error) {
      print('Connection error: $error'); // Added logging
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: MyAppBar(
          title: "Consultation",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () => Container(
                    child: Text(
                      'Connected Users: ${chatController.connnectedUser}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: color.secondary),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Obx(
                  () => ListView.builder(
                    itemCount: chatController.chatMessages.length,
                    itemBuilder: (context, index) {
                      var currentItem = chatController.chatMessages[index];
                      return MessageItem(
                        sentByMe: currentItem.sentByMe == socket.id,
                        message: currentItem.message,
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: color.primary),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: msgInputController,
                        decoration: InputDecoration(
                          hintText: 'Type here...',
                          hintStyle: TextStyle(
                            color: color.tertiary,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: color.primary,
                      ),
                      child: IconButton(
                        onPressed: () {
                          sendMessage(msgInputController.text);
                          msgInputController.text = '';
                        },
                        icon: Icon(
                          Icons.send,
                          size: 26,
                          color: color.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({
    Key? key,
    required this.sentByMe,
    required this.message,
  }) : super(key: key);

  final bool sentByMe;
  final String message;
  DateTime get dateTime => DateTime.now();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return Align(
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: sentByMe ? color.primary : Colors.grey,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              message,
              style: TextStyle(
                  color: sentByMe ? color.onPrimary : Colors.black,
                  fontSize: 18),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              formattedTime,
              style: TextStyle(
                  color: (sentByMe ? color.onPrimary : Colors.black)
                      .withOpacity(0.7),
                  fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
