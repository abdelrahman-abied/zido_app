import 'package:flutter/material.dart';
import 'package:zido_app/utils/components.dart';
import 'package:zido_app/utils/constants.dart';
import 'package:zido_app/utils/style.dart';

class PrivateZido extends StatefulWidget {
  PrivateZido({Key? key}) : super(key: key);

  @override
  _PrivateZidoState createState() => _PrivateZidoState();
}

class _PrivateZidoState extends State<PrivateZido> {
  List<Map<String, dynamic>> data = [
    {
      "title": "غرفة مزاد خاص اسم عشوائى لملا الفراغ فى سطرين عير منظمين",
      "image": 'assets/images/pants.png',
      "name": "ايما جريس",
      "hash": "@grace_ema",
      "icon": "assets/icons/icon2.png",
      "isJoined": true
    },
    {
      "title": "غرفة مزاد خاص اسم عشوائى لملا الفراغ فى سطرين عير منظمين",
      "image": 'assets/images/pants.png',
      "name": "ايما جريس",
      "hash": "@grace_ema",
      "icon": "assets/icons/icon2.png",
      "isJoined": false
    },
    {
      "title": "غرفة مزاد خاص اسم عشوائى لملا الفراغ فى سطرين عير منظمين",
      "image": 'assets/images/pants.png',
      "name": "ايما جريس",
      "hash": "@grace_ema",
      "icon": "assets/icons/icon2.png",
      "isJoined": true,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            margin: const EdgeInsets.all(4),
            color: itemBgColor,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    data[index]["image"],
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        data[index]["title"],
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            child: Image.asset(
                              data[index]["icon"],
                            ),
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          Row(
                            children: [
                              Text(
                                data[index]["name"],
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 3),
                              const Icon(
                                Icons.check_circle,
                                color: primaryColor,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.alarm,
                                color: secondaryColor,
                              ),
                              SizedBox(width: 3),
                              Text(
                                "00:10:47",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            child: Text(
                              getString(context, 'isJoin'),
                            ),
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.zero,
                              backgroundColor: data[index]["isJoined"]
                                  ? primaryColor
                                  : accentColor,
                            ),
                            onPressed: () {},
                          )
                        ],
                      )
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
