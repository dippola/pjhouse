import 'package:flutter/material.dart';
import 'package:pjhouse/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

Widget showZoomPageViewDialog(BuildContext context, List<String> urlList, int position) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return ZoomPageViewDialog(urlList: urlList, position: position);
      });
  return Container();
}

class ZoomPageViewDialog extends StatefulWidget {
  final List<String> urlList;
  final int position;

  const ZoomPageViewDialog({super.key, required this.urlList, required this.position});

  @override
  State<ZoomPageViewDialog> createState() => _ZoomPageViewDialogState();
}

class _ZoomPageViewDialogState extends State<ZoomPageViewDialog> {
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
          Container(color: Colors.black),
          PageView.builder(
            controller: _pageController,
            itemCount: widget.urlList.length,
            itemBuilder: (context, index) {
              // return Image.asset(widget.urlList[index]);
              return CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: widget.urlList[index],
                placeholder: (context, url) {
                  return Center(child: CircularProgressIndicator(color: Color(0xff428b69)));
                },
              );
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
              child: Text("$position/$size", style: GoogleFonts.kanit(color: whiteColor)),
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

Widget showZoomOneDialog(BuildContext context, String src) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return ZoomOneDialog(src: src);
      });
  return Container();
}

class ZoomOneDialog extends StatelessWidget {
  const ZoomOneDialog({super.key, required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
        child: Stack(
      children: [
        Container(color: Colors.black),
        Center(
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: src,
            placeholder: (context, url) => CircularProgressIndicator(
              color: Color(0xff428b69),
            ),
          ),
        ),
        Positioned(
          top: 15.0,
          left: 15.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: Colors.white.withOpacity(0.2)),
              child: Icon(Icons.arrow_back_outlined, color: Colors.white),
            ),
          ),
        )
      ],
    ));
  }
}
