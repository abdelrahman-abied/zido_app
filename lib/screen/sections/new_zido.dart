import 'package:flutter/material.dart';
import 'package:zido_app/utils/style.dart';

class NewZido extends StatefulWidget {
  NewZido({Key? key}) : super(key: key);

  @override
  _NewZidoState createState() => _NewZidoState();
}

class _NewZidoState extends State<NewZido> {
  List itemImage = [
    'assets/images/pants.png',
    'assets/images/cover.png',
    'assets/images/pants.png'
  ];
  final List nameList = [
    'Cotton twill joggers بنطلون رياضي من القطن',
    'طقم غطاء لحاف من القطن',
    'Cotton twill joggers بنطلون رياضي من القطن'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: itemImage.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(2),
          width: size.width / 2 - 20,
          decoration: BoxDecoration(
            color: itemBgColor,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      itemImage[index],
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: FittedBox(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: itemBgColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Center(
                            child: Icon(
                              Icons.favorite_outline,
                              color: secondaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: accentColor,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3),
                child: const Text(
                  'س 00 : د 22 : ث 59',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: itemBgColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: '109',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'ر.س',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                nameList[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  color: accentColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: itemBgColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: primaryColor,
                            width: 2.0,
                          )),
                      child: const Text(
                        'حفر البطن',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: itemBgColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: secondaryColor,
                            width: 2.0,
                          )),
                      child: const Text(
                        'جديد',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
