import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';

class Faq extends StatelessWidget {
  final _foldingCellKey1 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey2 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey3 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey4 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey5 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey6 = GlobalKey<SimpleFoldingCellState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        appBar: AppBar(
          centerTitle: true,
          elevation:0.0,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text("FAQs",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      fontSize: 22.0,
                      color: appBarTextColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2))),
          backgroundColor: appBarColor,
        ),
        body:Container(
    child: SingleChildScrollView(
      child: Column(
      children: <Widget>[
      SimpleFoldingCell.create(
      key: _foldingCellKey1,
      frontWidget: _buildFrontWidget(_foldingCellKey1, "Who is this app for?"),
      innerWidget: _buildInnerWidget(_foldingCellKey1,"For normal peoples to healthcare ,pharmaceuticals ,physicians ,hospital nurses ,medical students ,nursing professionals ,pharmacy,physician assistants and for students who work in clinical practice and dispensary.\n",),
      cellSize: Size(MediaQuery.of(context).size.width, 140),
      padding: EdgeInsets.all(15),
      animationDuration: Duration(milliseconds: 300),
      borderRadius: 10,
      onOpen: () => print('cell 1 opened'),
      onClose: () => print('cell 1 closed'),
      ),
      SimpleFoldingCell.create(
      key: _foldingCellKey2,
      frontWidget: _buildFrontWidget(_foldingCellKey2, "How is  this app  useful?"),
      innerWidget: _buildInnerWidget(_foldingCellKey2,"With detailed information on 12000s of diseases and probable prescription drug info,this app is a free medical encyclopedia guide.Also there are additional features like Note Functionality,BMI calculator,Word of the day,Latest news,Quiz on medical fields and medical facts.\n",),
      cellSize: Size(MediaQuery.of(context).size.width, 125),
      padding: EdgeInsets.all(15),
      animationDuration: Duration(milliseconds: 300),
      borderRadius: 10,
      onOpen: () => print('cell 2 opened'),
      onClose: () => print('cell 2 closed'),
      ),
        SimpleFoldingCell.create(
          key: _foldingCellKey3,
          frontWidget: _buildFrontWidget(_foldingCellKey3, " From which devices can I use?"),
          innerWidget: _buildInnerWidget(_foldingCellKey3,"You can use this app in any Android device.\n ",),
          cellSize: Size(MediaQuery.of(context).size.width, 125),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print('cell 3 opened'),
          onClose: () => print('cell 3 closed'),
        ),
        SimpleFoldingCell.create(
          key: _foldingCellKey4,
          frontWidget: _buildFrontWidget(_foldingCellKey4, "How it is different from other Medical app?"),
          innerWidget: _buildInnerWidget(_foldingCellKey4,"Medic gives a detailed information about diseases,medicines.User can make personal notes for future uses. And also user can calculate Body Mass Index. And last thing ,User can get  additional features like Word of the day,Latest news,Quiz on medical fields and medical facts.",),
          cellSize: Size(MediaQuery.of(context).size.width, 125),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print('cell 4 opened'),
          onClose: () => print('cell 4 closed'),
        ),
        SimpleFoldingCell.create(
          key: _foldingCellKey5,
          frontWidget: _buildFrontWidget(_foldingCellKey5, "Why can't I hear the audio pronunciations?"),
          innerWidget: _buildInnerWidget(_foldingCellKey5,"First, please check that your device is not muted..Also, please make sure that you are connected to the Internet, a network connection is required to access, audio pronunciations.\n",),
          cellSize: Size(MediaQuery.of(context).size.width, 125),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print('cell 5 opened'),
          onClose: () => print('cell 5 closed'),
        ),
        SimpleFoldingCell.create(
          key: _foldingCellKey6,
          frontWidget: _buildFrontWidget(_foldingCellKey6, "Why use this app when I can use Google?"),
          innerWidget: _buildInnerWidget(_foldingCellKey6,"It’s quite likely that a lot of the information available via Google search.But there are many reasons why this app is beneficial. Some are Ease of use, Saves time, Detailed Info, Convenient",),
          cellSize: Size(MediaQuery.of(context).size.width, 125),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print('cell 6 opened'),
          onClose: () => print('cell 6 closed'),
        ),
      ],
      ),
    ),
    ));
  }

  Widget _buildFrontWidget(
      GlobalKey<SimpleFoldingCellState> key, String title) {
    return Container(
      color: cardColor1,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: GoogleFonts.aldrich(
                color: Color(0xFF2e282a),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: FlatButton(
              onPressed: () => key?.currentState?.toggleFold(),
              child: Text(
                "ANSWER",
              ),
              textColor: Colors.black,
              color: Colors.white,

          ),
          )
        ],
      ),
    );
  }

  Widget _buildInnerWidget(GlobalKey<SimpleFoldingCellState> key, String title) {
    return Container(
      color: Colors.deepPurple[200],
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
             title,
              style:TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                letterSpacing: 3.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: FlatButton(
              onPressed: () => key?.currentState?.toggleFold(),
              child: Text(
                "Close",
              ),
              textColor: Colors.black,
              color: Colors.white,
              splashColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
