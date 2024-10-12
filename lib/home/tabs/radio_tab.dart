import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami/model/radio_item.dart';
import 'package:islami/model/radio_response.dart';
import 'package:islami/shared_widgets/radio_item.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  AudioPlayer audioPlayer = AudioPlayer();
  List<Radios> radios = [];
  int currentRadioIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  Future<void> fetchRadios() async {
    radios = await getRadio();
    setState(() {});
  }

  void changeRadio(int direction) {
    audioPlayer.pause();
    if (direction == 1) {
      // Skip to next radio
      if (currentRadioIndex < radios.length - 1) {
        currentRadioIndex++;
      }
    } else if (direction == -1) {
      // Skip to previous radio
      if (currentRadioIndex > 0) {
        currentRadioIndex--;
      }
    }
    audioPlayer.play(UrlSource(radios[currentRadioIndex].url ?? ""));
    setState(() {}); // Update the UI
    print('Current Radio Index: $currentRadioIndex'); // Debug print
  }

  @override
  Widget build(BuildContext context) {
    return radios.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/radio_image.png',
                width: 412,
                height: 222,
              ),
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemCount: radios.length,
                  itemBuilder: (context, index) => SizedBox(
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: RadioItem(
                      radioItem: radios[index],
                      audioPlayer: audioPlayer,
                      onPlayPause: () {
                        print(
                            'Play/Pause button pressed for ${radios[index].name}');
                        if (currentRadioIndex != index) {
                          changeRadio(0);
                        } else {
                          // Toggle play/pause
                          if (audioPlayer.state == PlayerState.playing) {
                            audioPlayer.pause();
                          } else {
                            audioPlayer
                                .play(UrlSource(radios[index].url ?? ""));
                          }
                        }
                      },
                      onNext: () => changeRadio(1),
                      onPrevious: () => changeRadio(-1),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

Future<List<Radios>> getRadio() async {
  try {
    Uri url = Uri.parse('https://mp3quran.net/api/v3/radios');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      RadioResponse radioResponse = RadioResponse.fromJson(json);
      return radioResponse.radios ?? [];
    } else {
      throw Exception('Failed to load radios');
    }
  } catch (e) {
    print(e.toString());
    return [];
  }
}
