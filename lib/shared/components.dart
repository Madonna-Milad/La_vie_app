import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultMaterialButton({
   double? width,
   double ?height,
  required String buttonName,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.bold,
  Color textColor = Colors.grey,
 required Function onPressed,
}) {
  return Container(
    width: width,
    height:height ,
    alignment: Alignment.center,
    child: MaterialButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        buttonName,textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize, fontWeight: fontWeight, color: textColor,),
      ),
    ),
  );
}

Widget defaultTextFormField({
  double ?height,
   double ?width,
  required TextEditingController controller,
  IconData ?prefix,
  String ?label,
 
}) {
  return Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    child: TextFormField(
     textAlign: TextAlign.left,
     textAlignVertical: TextAlignVertical.bottom,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        
        border: OutlineInputBorder(),
        labelText: label,
        prefix: Icon(prefix),
      ),
       maxLines: 5,
    ),
  );
}

Widget defaultButton(
{
  double radius=5,
  required double width,
  required double height,
  required String label,
  required Function onPressed,
  required Color color,
   Color textColor=Colors.white,
   Color borderColor=Colors.green,
}

) {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(width: 1,color:borderColor),
        color: color,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      height: height ,
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: TextStyle(
              color:textColor, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ));
}


Widget homeScreenContainer({
required double width,
required double height,
required BuildContext context,
required String label,


}){

  return  Expanded(
    child: Container(
                  width: width*.14,
                  height: height*.04,
                  alignment: Alignment.center,
                  child:Text(label,textAlign: TextAlign.center,style: TextStyle(color:Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                    //  border: Border.all(
                    //  // color: Theme.of(context).primaryColor,
                      
                    //   //width: 2
                    //   )
                    )
                  ),
  );
}

Widget buildMarketItem({
  required double width,
  required double height,
  required int count,
 required Color buttonColor,
 required Function onPressPlus,
 required Function onPressMinus,
 required Function onPressButton,
 required String name,
 required int price,
 required String imagePath
}){
  return 
     Container(
                  
                    width: width *.43,
                    height: height *.4,
                    child: Material(
                      
                      elevation: 20,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                         padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        
                        ),
                        clipBehavior:Clip.antiAliasWithSaveLayer,
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    imagePath,
                                    width: width * .1,
                                    height: height * .1,
                                  ),
                                ),
                                SizedBox(
                                  width: width * .02,
                                ),
                               
                                   defaultMaterialButton(
                                      buttonName: '-',
                                      onPressed: () {
                                        onPressMinus();
                                      },
                                      fontSize: 15,
                                      height: height * .035,
                                      width: width * .06),
                                
                                
                                  Text(
                                    count.toString(),
                                    style: TextStyle(
                                        fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                
                                defaultMaterialButton(
                                    buttonName: '+',
                                    onPressed: () {
                                      onPressPlus();
                                    },
                                    fontSize: 15,
                                    height: height * .05,
                                    width: width * .06),
                              ],
                            ),
                            Text(name),
                            Text(price.toString()),
                            SizedBox(height: height * .01),
                            defaultButton(
                              color: buttonColor,
                                width: width * .34,
                                height: height * .04,
                                label: 'Add To Cart',
                                onPressed: () {
                                  onPressButton();
                                })
                          ],
                        ),
                      ),
                    ),
                  );
  
}

Widget buildChoiceItem({
  double? width,
  double? height,
 required String choice,
 //bool? isSelected,
 required Function onTap,
 Color color=Colors.white,
}){
  return  Container(
            padding: EdgeInsets.all(width!*.03),
            child:Row(children: [
            Expanded(child: Text(choice,)),
            
            Stack(children: [
              CircleAvatar(backgroundColor: Colors.green,radius: height!*.016,),
              CircleAvatar(backgroundColor: Colors.white,radius: height*.014,),
              GestureDetector(
                child:CircleAvatar(backgroundColor: color,radius: height*.012,),
                onTap:(){
                 onTap();
                } ,
              )
             

            ],
            alignment: AlignmentDirectional.center,)
          ],),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2,color: Colors.green)
          ),);
}