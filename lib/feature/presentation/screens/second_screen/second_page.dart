import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child:  Column(
        children: [
          const SizedBox(
            height: 15
          ),
          const Center(child:
          Text(
            'SEARCH NEWS',
            style: MyTextStyles.giantTitleTextStyle,
          ),),
          const SizedBox(
              height: 15
          ),
          const SearchBar(

            hintText: 'find news by keywords',
          ),
          const SizedBox(
              height: 15
          ),
          Expanded(child:
          ListView.separated(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index){
                return Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.green,
                );
              },
              separatorBuilder: (BuildContext context, int index){
                return const Divider(
                  height: 60,
                  indent: 40,
                  endIndent: 40,
                  thickness: 1,
                  color: MyColors.myBlackColor,
                );
              },
          ),
          ),


        ],
      ),
    );
  }

}