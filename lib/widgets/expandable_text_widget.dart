import 'package:flutter/material.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';
import 'package:terence_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      print(firstHalf);
      secondHalf = widget.text.substring(
        textHeight.toInt() + 1,
        widget.text.length,
      );
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(height:1.8,color:Colors.black,size:Dimensions.font16,text: firstHalf)
          : Column(
              children: [
                SmallText(height:1.8,color:Colors.black,size: Dimensions.font16,maxLines: 30,
                    text: hiddenText
                        ? ("$firstHalf...")
                        : (firstHalf + secondHalf),
                       
                        ),
                        InkWell(
                          onTap: (){
                              setState(() {    
                                 print(firstHalf);
                                hiddenText=!hiddenText;
                              });
                          },
                          child: Row(children: 
                          [SmallText(text: "Show more", color: AppColors.pink,),
                          Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.pink)]),
                        )
              ],
            ),
    );
  }
}
