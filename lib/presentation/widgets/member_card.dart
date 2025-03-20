import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.015),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: screenWidth * 0.05,
            backgroundColor: Colors.grey.shade300,
            child: ClipOval(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: screenWidth * 0.10,
                height: screenWidth * 0.10,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.person, size: screenWidth * 0.05, color: Colors.grey);
                },
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.025),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '@$username',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                Text(
                  fullName,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  bio,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
