import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provide.dart';
import 'package:news_app/utils/colors.dart';
import 'package:provider/provider.dart';

import '../models/news_models.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool All = true;
  bool Business = false;
  bool Entertainment = false;
  bool Health = false;
  bool Science = false;
  bool Sports = false;
  bool Technology = false;

  apiCall() {
    Provider.of<NewsProvider>(context, listen: false).allDataApi();
  }

  @override
  void initState() {
    super.initState();
    apiCall();
    // NewsApiHelper.newsApiHelper.fetchData(category: "health");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("asserts/image/newss.png",width: 150),
                Spacer(),
                InkWell(
                    onTap: (){
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changTheme();
                    },
                    child: Icon(Icons.light_mode,color: Theme.of(context).primaryColor,)),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(blurRadius: 15, color: Colors.black12)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Serch news")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  optionCon(
                    name: "All",
                    OnTab: () {
                      All = true;
                      Business = false;
                      Entertainment = false;
                      Health = false;
                      Science = false;
                      Sports = false;
                      Technology = false;
                    },
                    category:All,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  optionCon(
                    name: "Business",
                    OnTab: () {
                      All = false;
                      Business = true;
                      Entertainment = false;
                      Health = false;
                      Science = false;
                      Sports = false;
                      Technology = false;
                    },
                    category:Business,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  optionCon(
                    name: "Entertainment",
                      OnTab: () {
                        All = false;
                        Business = false;
                        Entertainment = true;
                        Health = false;
                        Science = false;
                        Sports = false;
                        Technology = false;
                      },
                    category:Entertainment,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  optionCon(
                    name: "Health",
                    OnTab: () {
                      All = false;
                      Business = false;
                      Entertainment = false;
                      Health = true;
                      Science = false;
                      Sports = false;
                      Technology = false;
                    },
                    category:Health,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  optionCon(
                    name: "Science",
                    OnTab: () {
                      All = false;
                      Business = false;
                      Entertainment = false;
                      Health = false;
                      Science = true;
                      Sports = false;
                      Technology = false;
                    },
                    category:Science,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  optionCon(
                    name: "Sports",
                    OnTab: () {
                      All = false;
                      Business = false;
                      Entertainment = false;
                      Health = false;
                      Science = false;
                      Sports = true;
                      Technology = false;
                    },
                    category: Sports,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  optionCon(
                    name: "Technology", OnTab: () {
                    All = false;
                    Business = false;
                    Entertainment = false;
                    Health = false;
                    Science = false;
                    Sports = false;
                    Technology = true;
                  }, category:Technology,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder(
                  future: Provider.of<NewsProvider>(context).newsList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      List<Articles> allData = snapshot.data!;

                      return ListView.builder(
                          itemCount: allData.length,
                          itemBuilder: (context, i) {
                            String Date = allData[i].publishedAt!.split("T")[0];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, "DetailScreen",arguments:i);
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Theme.of(context).cardColor,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10,
                                            color: Colors.black12,
                                            blurStyle: BlurStyle.inner)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.grey[200],
                                              maxRadius: 15,
                                              child: Icon(
                                                  Icons.supervised_user_circle),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${allData[i].source?.name}",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            Spacer(),
                                            //Text("06:41:50",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${allData[i].title}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        (allData[i].urlToImage == null)
                                            ? Container()
                                            : Container(
                                                height: 180,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    color: Colors.grey,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${allData[i].urlToImage}"),
                                                        fit: BoxFit.cover)),
                                              ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.date_range,
                                                  size: 18,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "${Date.split("-")[2]}/${Date.split("-")[1]}/${Date.split("-")[0]}",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.more_horiz_rounded,
                                                  size: 18,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  optionCon({required name, required OnTab,required category}) {
    return InkWell(
      onTap: () {
        OnTab();
        (All != true)?Provider.of<NewsProvider>(context, listen: false)
            .updateApi(category: name):Provider.of<NewsProvider>(context, listen: false)
            .allDataApi();
      },
      child: Container(
        height: 40,
        decoration: (category == true)?BoxDecoration(
            borderRadius: BorderRadius.circular(5), color:(Provider.of<ThemeProvider>(context).isDark == false)?Theme.of(context).primaryColor:Theme.of(context).cardColor,border: Border.all(color: (Provider.of<ThemeProvider>(context).isDark == false)?Theme.of(context).primaryColor:Theme.of(context).cardColor,width: 1.3)):BoxDecoration(
          borderRadius: BorderRadius.circular(5), border: Border.all(color: (Provider.of<ThemeProvider>(context).isDark == false)?Theme.of(context).primaryColor:Theme.of(context).cardColor,width: 1.3)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: (category == true)?Text(name,style: (Provider.of<ThemeProvider>(context).isDark == false)?TextStyle(color:Theme.of(context).cardColor):TextStyle(color: Colors.black)):
            Text(name,style: TextStyle(color: (Provider.of<ThemeProvider>(context).isDark == false)?Theme.of(context).primaryColor:Theme.of(context).cardColor),),
          ),
        ),
      ),
    );
  }
}
