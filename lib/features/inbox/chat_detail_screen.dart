import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatsDetailScreen extends StatefulWidget {
  const ChatsDetailScreen({super.key});
  @override
  State<ChatsDetailScreen> createState() => _ChatsDetailScreenState();
}

class _ChatsDetailScreenState extends State<ChatsDetailScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  bool _isWriting = false;

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _textEditingController.clear();
      _isWriting = false;
    });
  }

  void _onChanged(String value) {
    print('changed: $value');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/29852320?s=400&u=a64dc19ce958d91b81e109642f5d6b913317dae9&v=4'),
                child: Text('Jess'),
              ),
              Container(
                width: Sizes.size18,
                height: Sizes.size18,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white,
                    width: Sizes.size3,
                  ),
                ),
              )
            ],
          ),
          title: const Text(
            'Jess',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text('Active now'),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Sizes.size14),
                      decoration: BoxDecoration(
                          color: isMine
                              ? Colors.blue
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(Sizes.size20),
                            topRight: const Radius.circular(Sizes.size20),
                            bottomLeft:
                                Radius.circular(isMine ? Sizes.size20 : 0),
                            bottomRight:
                                Radius.circular(!isMine ? Sizes.size20 : 0),
                          )),
                      child: const Text(
                        'this is a message',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10,
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade50,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size4,
                ),
                child: Row(
                  children: [
                    Gaps.h16,
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        onTap: _onStartWriting,
                        onChanged: _onChanged,
                        maxLines: null,
                        minLines: null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsetsGeometry.lerp(
                            const EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                            ),
                            const EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                            ),
                            0.5,
                          ),
                          hintText: 'Type a message',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade300,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.size20),
                              topRight: Radius.circular(Sizes.size20),
                              bottomLeft: Radius.circular(Sizes.size20),
                              bottomRight: Radius.circular(0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: FaIcon(
                              FontAwesomeIcons.faceSmile,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          // contentPadding: const EdgeInsets.symmetric(
                          //   horizontal: Sizes.size12,
                          // ),
                        ),
                      ),
                    ),
                    Gaps.h20,
                    Padding(
                      padding: const EdgeInsets.only(
                        right: Sizes.size16,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(Sizes.size8),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.paperPlane,
                              color: Colors.white,
                              size: Sizes.size20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
