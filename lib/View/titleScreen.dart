import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mias/View/youtubeplayeer.dart';
import 'package:mias/utils/appbar.dart';
import 'package:mias/utils/constants.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key, required this.subject, required this.chapter});
  final String subject;
  final String chapter;

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
 bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: constAppbar(title: widget.chapter, elevation: 5),
        body: Container(
            height: MediaQuery.of(context).size.height,
            color: mainColor,
            child: loading ? const Center(child: CircularProgressIndicator()) : titlesList.isEmpty || titlesList[0].isEmpty ? noTopicContainer():
             ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => youtubeplayer(
                                    videoUrl: linksList[0]["${index + 1}"],
                                    videoTitle: titlesList[0]["${index + 1}"],
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 15,left: 10,right: 10),
                      child: Text(
                        titlesList[0]["${index + 1}"],
                        style: buttonFontstyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                itemCount: titlesList.isEmpty? 0 : titlesList[0].length)));
  }

  noTopicContainer(){
    return Center(
      child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
                color: const Color(0xff872341),
                borderRadius: BorderRadius.circular(15)),
            child: Center(child: Text('THERE ARE NO TOPICS ASSIGNED FOR THIS CHAPTER', style: noTaskContainerstyle,textAlign: TextAlign.center,)),
          ),
    );
  }

  Future<void> getdata() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('plusone')
              .doc(widget.subject)
              .collection(widget.chapter)
              .get();

      linksList.clear();
      titlesList.clear();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        String documentType = documentSnapshot.id;

        if (documentType == 'title' || documentType == 'links') {
          // Extract all fields from the document
          Map<String, dynamic> fields =
              documentSnapshot.data() as Map<String, dynamic>;

          // Add fields to the appropriate list based on the document type
          if (documentType == 'title') {
            titlesList.add(fields);
          } else if (documentType == 'links') {
            linksList.add(fields);
          }
        }
      }

      // Update the UI to reflect the changes
      setState(() {
        loading = false;
      });
    } catch (e) {
      print('Error getting data: $e');
    }
  }
}
