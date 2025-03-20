import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genuin_task/presentation/widgets/reel_player.dart';
import 'package:genuin_task/data/models/feed_data/feed_data.dart';
import 'package:genuin_task/presentation/bloc/feed/feed_bloc.dart';
import 'package:genuin_task/presentation/bloc/feed/feed_event.dart';
import 'package:genuin_task/presentation/bloc/feed/feed_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state is FeedLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FeedLoaded) {
            return PageView.builder( 
              scrollDirection: Axis.vertical,
              itemCount: state.feeds.length,
              itemBuilder: (context, index) {
                return ReelPlayer(data: state.feeds[index]);
              },
            );
          } else if (state is FeedError) {
            return Center(child: Text(state.message, style: TextStyle(color: Colors.white)));
          } else {
            return const Center(child: Text("No data available", style: TextStyle(color: Colors.white)));
          }
        },
      ),
    );
  }
}
