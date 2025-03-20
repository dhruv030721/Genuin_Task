import 'package:flutter/material.dart';
import 'package:genuin_task/data/models/group_data/group_data.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupCard extends StatelessWidget {
  final GroupData group;
  const GroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    // Calculate total height needed for images including overlap
    final int imageCount =
        group.recentPosts.length > 3 ? 3 : group.recentPosts.length;
    final double imageHeight = 180.0;
    final double overlapOffset = 8.0;
    final double totalStackHeight =
        imageHeight + ((imageCount - 1) * overlapOffset);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE5E5E5), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(screenHeight * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              group.groupName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "${group.lastPostedBy.split(' ')[0].toLowerCase()} ",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "posted · ",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        group.recentPosts.isNotEmpty
                                            ? '${group.recentPosts.length}w'
                                            : 'recently',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Container(
                        width: double.infinity,
                        height: screenHeight * 0.15,
                        color: Colors.grey.shade100,
                        child: Padding(
                          padding: EdgeInsets.all(screenHeight * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: screenHeight * 0.05,
                                child: Stack(
                                  children: List.generate(
                                    group.groupCollaborators.length > 3
                                        ? 3
                                        : group.groupCollaborators.length,
                                    (index) => Positioned(
                                      left: index * 20.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Colors.grey.shade300,
                                          child: ClipOval(
                                            child: Image.network(
                                              group
                                                  .groupCollaborators[index]
                                                  .profile_image,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => Icon(
                                                    Icons.person,
                                                    size: 12,
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                width: screenWidth * 0.4,
                                child: Text(
                                  group.groupDescription,
                                  maxLines: 1,
                                  overflow:
                                      TextOverflow
                                          .ellipsis, 
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: screenHeight * 0.27,
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    for (int index = 0; index < imageCount; index++)
                      Positioned(
                        right: index * overlapOffset,
                        top: index * overlapOffset,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              group
                                  .recentPosts[group.recentPosts.length -
                                      1 -
                                      index]
                                  .thumbnailUrl,
                              width: 110,
                              height: imageHeight,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) => Container(
                                    width: 90,
                                    height: imageHeight,
                                    color: Colors.grey.shade500,
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
