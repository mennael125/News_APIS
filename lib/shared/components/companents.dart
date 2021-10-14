import 'package:apis/modules/web_view/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemBuild(article,context) => InkWell(
  onTap: (){
    PagePush(context, WebScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child:   Row(

          mainAxisAlignment: MainAxisAlignment.start,

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Expanded(

              child: Container(

                height: 120,

                width: 120,

      child: ClipRRect(

        borderRadius: BorderRadius.circular(10.0),

        child: article['urlToImage'] == null ? Placeholder(color: Colors.black,

          strokeWidth: 1,)

            : Image.network(

          "${article['urlToImage']}",

          fit: BoxFit.cover,

        ),),



                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),



                //   image: DecorationImage(

                //     image:NetworkImage('${article['urlToImage']} ',),

                //     fit: BoxFit.cover,

                //

                  ),





                ),

              ),



            const SizedBox(

              width: 20,

            ),

            Expanded(

              child: Container(

                height: 120,

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    Expanded(

                        child: Text(

                      '${article['title']}',           textDirection: TextDirection.rtl,



                          style:Theme.of(context).textTheme.bodyText1,

                          maxLines: 3,

                          overflow: TextOverflow.ellipsis,

                        ),),

                    Text(

                      '${article['publishedAt']}',

                      style: TextStyle(

                          fontSize: 15,

                          fontWeight: FontWeight.w600,

                          color: Colors.grey),

                    )

                  ],

                ),

              ),

            )

          ],

        ),

  ),
);

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 2,
        color: Colors.grey,
      ),
    );

Widget pageBuilder(list,context) =>ListView.separated(

    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => itemBuild(list[index],context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: 10);

Widget defaultTextFormFiled ({
  required FormFieldValidator<String> validate,
 required TextEditingController cont,
  required TextInputType keyboard ,
 required ValueChanged<String> onChange,
  required IconData icon ,
  required String text,
})=>
    TextFormField(
      validator:validate ,
controller:cont ,
onChanged:onChange ,
    keyboardType:keyboard ,

    decoration: InputDecoration(
      prefixIcon: Icon( icon) ,
      hintText: text ,
      enabledBorder:   OutlineInputBorder(borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 2.0,
        ), ),
      focusedBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(        color: Colors.deepOrange,

          width: 2.0,

        ),

    ),


    ));
void PagePush(context, widget)=>
  Navigator.push(
      (context),
      MaterialPageRoute(
          builder: (context) =>
          widget));
