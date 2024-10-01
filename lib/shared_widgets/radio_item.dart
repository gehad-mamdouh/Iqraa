import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/model/radio_item.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';

class RadioItem extends StatefulWidget {
  final Radios radioItem;
  final AudioPlayer audioPlayer;

  const RadioItem(
      {super.key, required this.radioItem, required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            widget.radioItem.name ?? "",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
          ),
        ),
        const SizedBox(height: 20), // Add spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 50,
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous,
                color: provider.appTheme == ThemeMode.light
                    ? const Color(0xffB7935F)
                    : const Color(0xffFACC1D),
              ),
            ),
            IconButton(
              iconSize: 100,
              onPressed: () {
                !isClicked
                    ? widget.audioPlayer
                        .play(UrlSource(widget.radioItem.url ?? ""))
                    : widget.audioPlayer.pause();
                isClicked = !isClicked;
                setState(() {});
              },
              icon: Icon(
                !isClicked ? Icons.play_arrow_rounded : Icons.pause,
                color: provider.appTheme == ThemeMode.light
                    ? const Color(0xffB7935F)
                    : const Color(0xffFACC1D),
              ),
            ),
            IconButton(
              iconSize: 50,
              onPressed: () {},
              icon: Icon(
                Icons.skip_next,
                color: provider.appTheme == ThemeMode.light
                    ? const Color(0xffB7935F)
                    : const Color(0xffFACC1D),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
