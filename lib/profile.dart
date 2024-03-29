import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blogclub_project/data.dart';
import 'package:flutter_blogclub_project/gen/assets.gen.dart';
import 'package:flutter_blogclub_project/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: themeData.colorScheme.background.withOpacity(0),
              title: const Text('Profile'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_horiz_rounded),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: themeData.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.1))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Assets.img.stories.story8
                                    .image(width: 84, height: 84)),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('@joviedan'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Jovi Daniel',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                          color: themeData.colorScheme.primary,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Text(
                          'About me',
                          style: themeData.textTheme.titleLarge!
                              .apply(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text(
                          'jasnalsdknslfkcnsdknvdskjndncshguweghn efSFKSJDNF KSJNFKJ NKESJ KSJDGKJbkjbkjg kajsdgkjb r ',
                          style: themeData.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 32,
                    left: 96,
                    right: 96,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(.8))
                      ]),
                    )),
                Positioned(
                    bottom: 32,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 68,
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff2151cd),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '52',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Post',
                                      style: themeData.textTheme.bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '250',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Following',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5K',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'followers',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ))
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'My Posts',
                          style: themeData.textTheme.titleLarge!
                              .copyWith(color: Colors.black),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.circle_grid_3x3_fill)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.text_justify))
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++) Post(post: posts[i])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
