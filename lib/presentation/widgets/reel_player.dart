import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelPlayer extends StatefulWidget {
  final String videoUrl;

  const ReelPlayer({super.key, required this.videoUrl});

  @override
  _ReelPlayerState createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer> {
  late VideoPlayerController _controller;
  bool isLiked = false;
  int likeCount = 120; // Dummy like count
  int commentCount = 30; // Dummy comment count

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    // Listen for video end and replay manually
    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        _controller.seekTo(Duration.zero);
        _controller.play();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video Player
        Positioned.fill(
          child:
              _controller.value.isInitialized
                  ? VideoPlayer(_controller)
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
                onTap: toggleLike,
                child: Column(
                  children: [
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.white,
                      size: 32,
                    ),
                    Text(
                      likeCount.toString(),
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
                      commentCount.toString(),
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
              "https://i.pravatar.cc/150?img=3", // Dummy profile image
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "@username", // Dummy username
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      
      const SizedBox(height: 8), // Spacing between username and caption

      // Caption
      const Text(
        "This is a sample caption for the video...",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),

      const SizedBox(height: 8), // Spacing between caption and community tags

      // Community Name Containers
      Row(
        children: [
          // Community Tag 1
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), // Semi-transparent black background
              borderRadius: BorderRadius.circular(20), // Rounded edges
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3", // Dummy profile image
                  ),
                ),
                const SizedBox(width: 5),
                const Text('Community Name', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          const SizedBox(width: 10), // Spacing between two community tags

          // Community Tag 2
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), // Semi-transparent black background
              borderRadius: BorderRadius.circular(20), // Rounded edges
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3", // Dummy profile image
                  ),
                ),
                const SizedBox(width: 5),
                const Text('Community Name', style: TextStyle(color: Colors.white)),
              ],
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
