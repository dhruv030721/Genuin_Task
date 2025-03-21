import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genuin_task/data/repositories/community_repository.dart';
import 'package:genuin_task/presentation/bloc/community/community_bloc.dart';
import 'package:genuin_task/presentation/bloc/community/community_event.dart';
import 'package:genuin_task/presentation/bloc/community/community_state.dart';
import 'package:genuin_task/presentation/pages/tabs/group_tab.dart';
import 'package:genuin_task/presentation/pages/tabs/member_tab.dart';
import 'package:genuin_task/presentation/widgets/info_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
class CommunityScreen extends StatelessWidget {
  final String communityId;

  CommunityScreen({required this.communityId});

  void _shareContent(String link) async {
  try {
    await Share.share(link);
  } catch (e) {
    print("Error sharing content: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create:
          (context) =>
              CommunityBloc(CommunityRepository())
                ..add(FetchCommunityData(communityId)),
      child: BlocBuilder<CommunityBloc, CommunityState>(
        builder: (context, state) {
          if (state is CommunityLoading) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is CommunityLoaded) {
            final communityData = state.communityData;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
                title: Text(
                  communityData.name, // Now accessible
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                centerTitle: true,
              ),
              body: SafeArea(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // **Community Banner**
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            child: Image.network(
                              communityData.banner.isNotEmpty
                                  ? communityData.banner
                                  : 'https://media.licdn.com/dms/image/v2/D4D16AQHdOQIQNRny1g/profile-displaybackgroundimage-shrink_350_1400/profile-displaybackgroundimage-shrink_350_1400/0/1737859889124?e=1747872000&v=beta&t=rUzeJ7XPLawNZtKOtcgLh2YtUE-5fIfr65jxYQpnGx0',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  'https://media.licdn.com/dms/image/v2/D4D16AQHdOQIQNRny1g/profile-displaybackgroundimage-shrink_350_1400/profile-displaybackgroundimage-shrink_350_1400/0/1737859889124?e=1747872000&v=beta&t=rUzeJ7XPLawNZtKOtcgLh2YtUE-5fIfr65jxYQpnGx0',
                                  fit: BoxFit.contain,
                                );
                              },
                            ),
                          ),
                          Positioned(
                            bottom: -40,
                            left: 16,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.black,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  child: Image.network(communityData.logo),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    communityData.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      55,
                                      39,
                                      200,
                                    ),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Join',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 55, 39, 200),
                                    ), // Blue border
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ), 
                                    ),
                                  ),
                                  onPressed: () {
                                    _shareContent(communityData.share_url);
                                  },
                                  child: Icon(
                                    Icons.reply_all, 
                                    color: Color.fromARGB(255, 55, 39, 200), 
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              communityData.description,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                InfoTile(
                                  count: communityData.no_of_members,
                                  label: 'Members',
                                ),
                                SizedBox(width: screenWidth * 0.05),
                                InfoTile(
                                  count: communityData.no_of_groups,
                                  label: 'Groups',
                                ),
                                SizedBox(width: screenWidth * 0.05),
                                InfoTile(
                                  count: communityData.no_of_videos,
                                  label: 'Videos',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: screenWidth * 0.6,
                          child: TabBar(
                            dividerHeight: 0,
                            indicatorColor: Color.fromARGB(255, 55, 39, 200),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            tabs: [Tab(text: 'Groups'), Tab(text: 'Members')],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 3,
                        child: Container(color: Colors.grey.shade200),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            GroupTab(communityId: communityId),
                            MemberTab(communityId: communityId),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is CommunityError) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(child: Text(state.message)),
            );
          }
          return Container();
        },
      ),
    );
  }
}
