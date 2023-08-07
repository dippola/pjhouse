import 'package:flutter/material.dart';
import 'package:pjhouse/style.dart';
import 'package:google_fonts/google_fonts.dart';

Widget showZoomDialog(BuildContext context, List<String> urlList, int position) {
  // isDesktop(context)
  //     ? showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return ZoomDialogDesktop(urlList: urlList, position: position);
  //         })
  //     : isTab(context)
  //         ? showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return ZoomDialogTab(urlList: urlList, position: position);
  //             })
  //         : showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return ZoomDialogMobile(urlList: urlList, position: position);
  //             });
  // return Container();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return ZoomDialogMobile(urlList: urlList, position: position);
      });
  return Container();
}

class ZoomDialogDesktop extends StatefulWidget {
  final List<String> urlList;
  final int position;
  const ZoomDialogDesktop({super.key, required this.urlList, required this.position});

  @override
  State<ZoomDialogDesktop> createState() => _ZoomDialogDesktopState();
}

class _ZoomDialogDesktopState extends State<ZoomDialogDesktop> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.amber,

      ),
    );
  }
}

class ZoomDialogTab extends StatefulWidget {
  final List<String> urlList;
  final int position;
  const ZoomDialogTab({super.key, required this.urlList, required this.position});

  @override
  State<ZoomDialogTab> createState() => _ZoomDialogTabState();
}

class _ZoomDialogTabState extends State<ZoomDialogTab> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}

class ZoomDialogMobile extends StatefulWidget {
  final List<String> urlList;
  final int position;
  const ZoomDialogMobile({super.key, required this.urlList, required this.position});

  @override
  State<ZoomDialogMobile> createState() => _ZoomDialogMobileState();
}

class _ZoomDialogMobileState extends State<ZoomDialogMobile> {

  late PageController _pageController;
  late int size;
  late int position;

  @override
  void initState() {
    // TODO: implement initState
    size = widget.urlList.length;
    position = widget.position;
    _pageController = PageController(initialPage: position - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Stack(
        children: [
          Container(
            color: Colors.black
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: widget.urlList.length,
            itemBuilder: (context, index) {
              return Image.asset(widget.urlList[index]);
            },
            onPageChanged: (index) {
              position = index + 1;
              setState(() {});
            },
          ),
          Positioned(
            right: 10.0,
            top: 10.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: Colors.white.withOpacity(0.2)),
              child: Text("$position/$size", style: GoogleFonts.prompt(color: whiteColor)),
            ),
          ),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 5.0,
            child: IconButton(
              onPressed: () {
                if (position > 1) {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() {
                    position--;
                  });
                }
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            right: 5.0,
            child: IconButton(
              onPressed: () {
                if (position < widget.urlList.length) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() {
                    position++;
                  });
                }
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            left: 10.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back_outlined, color: Colors.white.withOpacity(0.8)),
              onPressed: () {
                print("pop");
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}