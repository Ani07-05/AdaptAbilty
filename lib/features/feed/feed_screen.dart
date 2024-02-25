import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc/core/common/error_text.dart';
import 'package:gdsc/core/common/loader.dart';
import 'package:gdsc/core/common/post_card.dart';
import 'package:gdsc/features/community/controller/community_controller.dart';
import 'package:gdsc/features/post/controller/post_controller.dart';
import 'package:gdsc/models/post_model.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userCommunitiesProvider).when(
          data: (communities) => ref.watch(userPostsProvider(communities)).when(
                data: (List<Post> data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, index) {
                      final post = data[index];
                      return PostCard(
                          post: post); // Use the PostCard widget here
                    },
                  );
                },
                error: (error, stackTrace) {
                  print(error);
                  return ErrorText(error: error.toString());
                },
                loading: () => const Loader(),
              ),
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
