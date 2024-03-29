import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:front/controller/chat_contoller.dart';
import 'package:front/data/data.dart';
import 'package:front/global/global.dart';
import 'package:get/get.dart';

class AvatarListWidget extends StatelessWidget {
  const AvatarListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    return SizedBox(
        width: 30 * 5,
        height: 34,
        child: Obx(
          () => Stack(
              children: controller.currentChatUsers.map((e) {
            int i = controller.currentChatUsers.indexOf(e);
            return i < 4
                ? Positioned(
                    top: 0,
                    left: 21 * i.toDouble(),
                    child: Container(
                        padding: const EdgeInsets.all(short),
                        decoration: BoxDecoration(
                            color: i % 2 == 0 ? blue : orange,
                            borderRadius: BorderRadius.circular(100)),
                        child: RoundedImage(
                          asset: imgTestUser,
                          width: 26,
                          height: 26,
                          url: e.profileImg,
                        )))
                : i == 4
                    ? Positioned(
                        top: 0,
                        left: 21 * 4,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(100)),
                          width: 30,
                          height: 30,
                          child: Text(
                            '+${controller.currentChatUsers.length - 4}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: -0.04),
                          ),
                        ),
                      )
                    : Container();
          }).toList()),
        ));
  }
}
