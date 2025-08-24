import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveStream extends StatefulWidget {
  const LiveStream({super.key});

  @override
  State<LiveStream> createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();

    // YouTube video ID from share link
    const videoId = "gqvQDsRGlI4";

    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Streams")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "YouTube Live",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          YoutubePlayer(controller: _youtubeController),
          
        ],
      ),
    );
  }
}
