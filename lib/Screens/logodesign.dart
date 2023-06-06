import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskapp/utils/AppColors.dart';
import 'package:taskapp/utils/AppImages.dart';



class ItemLogoRounded extends StatelessWidget {
  const ItemLogoRounded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(80),
              border: Border.all(color: AppColors.primary,width: 3,style: BorderStyle.solid),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  spreadRadius: 0,
                  blurRadius: 25,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Center(child: Text("ABC",style: TextStyle(fontSize: 30,fontFamily: "Outfit",fontWeight: FontWeight.w600),),)
          )
      ),
    );
  }
}

class ItemWhiteOpacityCircle extends StatefulWidget {
  const ItemWhiteOpacityCircle({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ItemWhiteOpacityCircleState();
  }

}
class _ItemWhiteOpacityCircleState extends State<ItemWhiteOpacityCircle> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  late final Animation<double> _animation2 = CurvedAnimation(
    parent: _controller2,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1200)).then((value) => _controller.forward());
    _controller.addListener(() async{
      if (_controller.isCompleted) {
        await Future.delayed(Duration(milliseconds: 200));
        _controller2.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ScaleTransition(
          scale: _animation2,
          child: Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.03),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(160),
                topRight: Radius.circular(160),
                bottomLeft: Radius.circular(160),
                bottomRight: Radius.circular(160),
              ),
            ),
          ),
        ),
        ScaleTransition(
          scale: _animation,
          child: Container(
            width: 230,
            height: 230,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(115),
                topRight: Radius.circular(115),
                bottomLeft: Radius.circular(115),
                bottomRight: Radius.circular(115),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget{
  ProfileImage({Key? key,required this.isFileSelected,required this.imagePath}) : super(key: key);

  bool isFileSelected;
  String imagePath = "";

  @override
  Widget build(BuildContext context) {
    print("selected file = ${isFileSelected}  ${imagePath}");
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(80),
          border: Border.all(color: AppColors.primary,width: 3,style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 0,
              blurRadius: 25,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: isFileSelected ? Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ) : (imagePath == "" ? Image.asset(
          AppImages.cardimg,
          fit: BoxFit.cover,
        ) : Image.network(
          imagePath,fit: BoxFit.cover,
        )),
      ),
    );
  }

}

