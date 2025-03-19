import 'package:flutter/material.dart';

class CommunityScreeen extends StatelessWidget {

    // final String profile_img;
    // final String banner_img;

    // CommunityScreeen({required this.profile_img, required this.banner_img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Handle'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack for banner image, profile picture, and top bar
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomLeft,
                children: [
                  // Banner Image
                  Container(
                    height: 120,
                    width: double.infinity,
                    // Community Banner Image
                    // child: Image.network(
                    //   'https://pi.tedcdn.com/r/pb-assets.tedcdn.com/system/baubles/files/000/008/810/original/talent_1.jpg?w=1200',
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  
                  // Top navigation bar
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {},
                          ),
                          Text(
                            'tedtalenthub',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Profile picture
                  Positioned(
                    bottom: -40,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                        //Community Profile Image 
                        // backgroundImage: NetworkImage(
                        //   'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/TED_logo.svg/2560px-TED_logo.svg.png',
                        // ),
                        child: Center(
                          child: Text(
                            'TED',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              // Spacer for profile picture overflow
              SizedBox(height: 50),
              
              // Profile information
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'TED Talent Hub',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Buttons
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text('Join'),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Icon(Icons.share_outlined, size: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 12),
                    
                    // Bio
                    Text(
                      'No Matter The Occasion, 1-800-Flowers.com Is The Best',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    
                    SizedBox(height: 24),
                    
                    // Additional content
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Co',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' pro',
                                style: TextStyle(
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    // Additional profile content would go here
                    SizedBox(height: 400),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

