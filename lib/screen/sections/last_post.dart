import 'package:flutter/material.dart';
import 'package:zido_app/model/post.dart';
import 'package:zido_app/utils/constants.dart';
import 'package:zido_app/utils/style.dart';

List<LatestPostModel> items = [
  LatestPostModel(
      date: 'Aug 23 2021',
      description: """هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء 
لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص 
أو شكل توضع الفقرات في الصفحة التي يقرأها. """,
      imagePath: Constants.imagePathApp + 'img1.jpg',
      pathICon: Constants.iconPathApp + 'icon1.png',
      title: 'natila sonnze'),
  LatestPostModel(
      date: 'Aug 23 2021',
      description: """هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء 
لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص 
أو شكل توضع الفقرات في الصفحة التي يقرأها. """,
      imagePath: Constants.imagePathApp + 'img2.jpg',
      pathICon: Constants.iconPathApp + 'icon2.png',
      title: 'natila sonnze'),
  LatestPostModel(
      date: 'Aug 23 2021',
      description: """هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء 
لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص 
أو شكل توضع الفقرات في الصفحة التي يقرأها. """,
      imagePath: Constants.imagePathApp + 'img3.jpg',
      pathICon: Constants.iconPathApp + 'icon2.png',
      title: 'natila sonnze')
];

class LastPosts extends StatelessWidget {
  const LastPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      primary: false,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          width: sizeScreen.width * .9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Stack(
                    children: [
                      Container(
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black54,
                              Colors.black
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, 0.2, 0.8, 1],
                          ),
                        ),
                        child: Expanded(
                          child: Image.asset(
                            items[index].imagePath,
                            width: sizeScreen.width * .9,
                            height: sizeScreen.width,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5.0,
                        right: 5.0,
                        bottom: 5.0,
                        child: Text(
                          items[index].description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: sizeScreen.width * .9,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16.0,
                        backgroundImage: AssetImage(items[index].pathICon),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                items[index].title,
                                style: const TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 3.0),
                              const Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                                size: 14.0,
                              )
                            ],
                          ),
                          Text(
                            '@' + items[index].title,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        items[index].date,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
