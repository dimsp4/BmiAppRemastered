import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Health News",
        ),
        foregroundColor: Colors.black54,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: getRequest(),
        builder: (context, AsyncSnapshot<List<News>> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              snapshot.data?[index].urlImage != null
                                  ? Expanded(
                                      flex: 3,
                                      child: Container(
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              snapshot.data![index].urlImage!,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      flex: 3,
                                      child: Container(
                                        height: 130,
                                        child: Center(
                                          child: Text("no image"),
                                        ),
                                      ),
                                    ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].title!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.data?[index].desc ?? "-",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                )
              : Center(
                  child: Container(
                    height: 300,
                    width: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
