import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String username;
  final String fullName;
  final String bio;
  final String imageUrl;

  const MemberCard({
    super.key,
    required this.username,
    required this.fullName,
    required this.bio,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade300, 
            child: ClipOval(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person, size: 24, color: Colors.grey);
                },
              ),
            ),
          ),

          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '@$username',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  fullName,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  bio,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
