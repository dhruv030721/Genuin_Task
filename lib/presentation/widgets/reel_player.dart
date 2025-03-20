import 'package:flutter/material.dart';
import 'package:genuin_task/data/models/feed_data/feed_data.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';
class ReelPlayer extends StatefulWidget {
  final FeedData data;

  const ReelPlayer({super.key, required this.data});

  @override
  _ReelPlayerState createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer> {
  late VideoPlayerController _controller;

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

   void _shareContent(String link) async {
  try {
    await Share.share(link);
  } catch (e) {
    print("Error sharing content: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Video Player
        Positioned.fill(
          child:
              _controller.value.isInitialized
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
              Icon(Icons.add_circle, color: Colors.white, size: 32),

              SizedBox(height: screenHeight * 0.03),
              Column(
                children: [
                  Icon(
                    Icons.tips_and_updates_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                  Text(
                    widget.data.no_of_sparks.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Column(
                children: [
                  const Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                  Text(
                    widget.data.no_of_comments.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              GestureDetector(
                onTap: () => _shareContent(widget.data.share_url),
                child: Icon(Icons.share_outlined, color: Colors.white, size: 32)),
              SizedBox(height: screenHeight * 0.03),
              Icon(Icons.more_horiz, color: Colors.white, size: 32),
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
              // Profile Image with Usern1ame
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: ClipOval(
                      child: Image.network(
                        widget.data.profile_image,
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                        errorBuilder:
                            (context, error, stackTrace) => const Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.grey,
                            ),
                      ),
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
                    onTap:
                        () => context.push(
                          '/community_screen/${widget.data.communityId}',
                        ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
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
                                padding: EdgeInsets.only(right: 5),
                                child: Text(
                                  widget.data.communityName,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          child: Icon(Icons.people, size: 15),
                        ),
                        const SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            widget.data.loopName,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
