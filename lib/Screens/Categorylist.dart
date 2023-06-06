

import 'package:flutter/material.dart';
import 'package:taskapp/Screens/Categorydetailpage.dart';
import 'package:taskapp/Screens/Productlist.dart';
import 'package:taskapp/model/Categorylist.dart';
import 'package:taskapp/services/Apiclass.dart';

class CategorylistScreen extends StatefulWidget {

  @override
  State<CategorylistScreen> createState() => Categotystate();
}

class Categotystate extends State<CategorylistScreen> {
  List<Category> list =  [];
  bool isLoading = true;
  String imagepath =
      "";
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //     titleSpacing: 0,
        //     elevation: 0,
        //     backgroundColor:Colors.purple,
        //     title: Text(
        //       "teachers",
        //
        //     ),
        //     leading: Container(
        //       margin: const EdgeInsets.all(10),
        //       child: GestureDetector(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         child:Text("")
        //       ),
        //     )),
        body: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child:ListView.builder(
                          itemCount: list.isEmpty?5:list.length,
                          itemBuilder: (context,position){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Categorydetail()));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [Row(
                                children: [
                                  Image.network(list.isEmpty?imagepath:list[position].bannerImage,fit: BoxFit.cover,
                                    height: 100,width: 100,),
                                  SizedBox(width: 20,),
                                  Text(list.isEmpty?"name":list[position].slug,maxLines:2,style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                  ),)
                                ],
                              )],
                            ),
                          ),
                        );
                      })

    ),
                  ],
                )),
            // Visibility(
            //     visible: isLoading,
            //     child:  Container(
            //       color: Colors.black.withOpacity(0.5),
            //       height: MediaQuery.of(context).size.height,
            //       width: MediaQuery.of(context).size.width,
            //       child: Center(
            //         child: LoadingLayout(),
            //       ),
            //     ))
          ],
        ));
  }

  void callAPI() async {
    print("CALL TEACHER API");
    Apiclass httpService = Apiclass();
    Categorylist country = await httpService.getcategorylist();
    if(country.code==1){
      //Categorylist teacher = Categorylist.fromJson(country);
      setState((){
        list=country.categories;
        isLoading=false;

      });
    }
    else{
      setState((){
        isLoading=false;

      });
    }





  }

}
