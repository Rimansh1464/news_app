import 'package:flutter/material.dart';
import 'package:news_app/models/news_models.dart';
import 'package:news_app/providers/news_provide.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
        backgroundColor: background,

        body: FutureBuilder(
      future: Provider.of<NewsProvider>(context).newsList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          List<Articles> allData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 44,
                  width: 44,
                  child: Center(
                    child: Icon(Icons.arrow_back),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      shape: BoxShape.circle),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${allData[id].title}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    maxRadius: 15,
                    child: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${allData[id].source?.name}",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        //Provider.of<NewsProvider>(context,listen: false).launchURLBrowser(uri: "https://zeenews.india.com/people/shocking-noted-punjabi-actress-daljeet-kaur-dies-at-kasba-sudhaar-bazaar-last-rites-held-today-2536725.html");
                        Provider.of<NewsProvider>(context, listen: false)
                            .LlaunchURLBrowser();
                      },
                      child: Text(
                        "Go to website...",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 210,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage("${allData[id].urlToImage}"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: 20,
              ),
                  Text.rich(
                    TextSpan(
                        text: "● ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [TextSpan(
                          text: "${allData[id].description}",
                          style: TextStyle(fontSize: 16, color: Colors.black38),

                        ),]
                    ),


                  ),
                  SizedBox(
                    height: 10,
                  ),
              Text.rich(
                TextSpan(
                  text: "● ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [TextSpan(
                      text: "${allData[id].content}",
                      style: TextStyle(fontSize: 16, color: Colors.black38),

                  ),]
                ),


              ),
            ]),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
