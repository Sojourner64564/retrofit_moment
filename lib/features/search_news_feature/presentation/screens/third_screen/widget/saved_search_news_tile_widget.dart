import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';

class SavedSearchNewsTileWidget extends StatelessWidget{
  const SavedSearchNewsTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 150,
        height: 40,
        child:  Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                'https://cdn.cnn.com/cnnnext/dam/assets/230725145534-mayorkas-may-11-file-super-tease.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
            const ColoredBox(color: MyColors.myWhite60Colors),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Microsoft and so on like google',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: MyTextStyles.mediumThickBlackTextStyle,
                  ),
                  Expanded(child: Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 1,
                    color: MyColors.myBlackColor,
                  ),),
                  Text('Data: 12.32.24',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MyTextStyles.littleThickTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}