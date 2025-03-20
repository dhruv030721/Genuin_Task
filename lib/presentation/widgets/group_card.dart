import 'package:flutter/material.dart';
import 'package:genuin_task/data/models/group_data/group_data.dart';

class GroupCard extends StatelessWidget {
  final GroupData group;
  const GroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    // Calculate total height needed for images including overlap
    final int imageCount = group.recentPosts.length > 3 ? 3 : group.recentPosts.length;
    final double imageHeight = 120.0;
    final double overlapOffset = 8.0;
    final double totalStackHeight = imageHeight + ((imageCount - 1) * overlapOffset);
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE5E5E5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
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
                SizedBox(height: 4),
                Text(
                  "@${group.lastPostedBy.split(' ')[0].toLowerCase()} posted · ${group.recentPosts.isNotEmpty ? '${group.recentPosts.length}w' : 'recently'}",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 28,
                  child: Stack(
                    children: List.generate(
                      group.groupCollaborators.length > 3 ? 3 : group.groupCollaborators.length,
                      (index) => Positioned(
                        left: index * 20.0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey.shade300,
                            child: ClipOval(
                              child: Image.network(
                                group.groupCollaborators[index].profile_image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Icon(
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
                Text(
                  "Workspace",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "${group.recentPosts.length} posts · ${group.groupDescription.split(' ').length * 26} views",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: totalStackHeight, 
              child: Stack(
                alignment: Alignment.topRight, 
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
                            group.recentPosts[group.recentPosts.length - 1 - index].thumbnailUrl,
                            width: 90,
                            height: imageHeight,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 90,
                              height: imageHeight,
                              color: Colors.grey.shade200,
                              child: Icon(Icons.image, color: Colors.grey.shade400),
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
    );
  }
}
