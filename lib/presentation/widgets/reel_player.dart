import 'package:flutter/material.dart';
import 'package:genuin_task/data/models/feed_data/feed_data.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class ReelPlayer extends StatefulWidget {
  final FeedData data;

  const ReelPlayer({super.key, required this.data});

  @override
  _ReelPlayerState createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer> {
  late VideoPlayerController _controller;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.data.videoUrl),
      )
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video Player
        Positioned.fill(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),

        // Overlay UI Elements
        Positioned(
          bottom: 60,
          right: 15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 15),

              // Like Button
              GestureDetector(
                child: Column(
                  children: [
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.white,
                      size: 32,
                    ),
                    Text(
                      widget.data.no_of_sparks.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // Comment Button
              GestureDetector(
                onTap: () {
                  // Handle comment action
                },
                child: Column(
                  children: [
                    const Icon(Icons.comment, color: Colors.white, size: 32),
                    Text(
                      widget.data.no_of_comments.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Username & Caption
        Positioned(
          bottom: 20,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image with Username
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      "https://media.qa.begenuin.com/uploads/brands/web_logo/brandWebLogo_1741337031738.png",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.data.ownerName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "This is a sample caption for the video...",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),

              const SizedBox(height: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.push('/community_screen/${widget.data.communityId}'),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(
                            widget.data.communityLogo,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            widget.data.communityName,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    radius: 10,
                    child: Icon(Icons.people, size: 15,),
                  ),
                  const SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      widget.data.loopName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
