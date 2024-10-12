import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/model/radio_item.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';

class RadioItem extends StatefulWidget {
  final Radios radioItem;
  final AudioPlayer audioPlayer;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const RadioItem({
    super.key,
    required this.radioItem,
    required this.audioPlayer,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlaying = false;

  void togglePlayPause() {
    if (isPlaying) {
      widget.audioPlayer.pause();
      print('Paused: ${widget.radioItem.name}');
      widget.audioPlayer.play(UrlSource(widget.radioItem.url ?? ""));
      print('Playing: ${widget.radioItem.name}');
    }
    setState(() {
      isPlaying = !isPlaying;
    });
    widget.onPlayPause();
  }

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
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 50,
              onPressed: () {
                widget.onPrevious();
                print('Previous button pressed');
              },
              icon: Icon(
                Icons.skip_previous,
                color: provider.appTheme == ThemeMode.light
                    ? const Color(0xffB7935F)
                    : const Color(0xffFACC1D),
              ),
            ),
            IconButton(
              iconSize: 100,
              onPressed: togglePlayPause,
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                color: provider.appTheme == ThemeMode.light
                    ? const Color(0xffB7935F)
                    : const Color(0xffFACC1D),
              ),
            ),
            IconButton(
              iconSize: 50,
              onPressed: () {
                widget.onNext();
                print('Next button pressed');
              },
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
