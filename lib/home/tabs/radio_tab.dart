import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami/model/radio_item.dart';
import 'package:islami/model/radio_response.dart';
import 'package:islami/shared_widgets/radio_item.dart';


class RadioTab extends StatelessWidget {
  RadioTab({super.key});

  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRadio(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No radios found'));
        }

        List<Radios> radios = snapshot.data as List<Radios>;
        return Column(
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
                itemBuilder: (context, index) => SizedBox(
                  height: MediaQuery.of(context).size.width *
                      0.5, // Adjust height as needed
                  child: RadioItem(
                    radioItem: radios[index],
                    audioPlayer: audioPlayer,
                  ),
                ),
                itemCount: radios.length,
              ),
            )
          ],
        );
      },
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