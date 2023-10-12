import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutter/features/auth/auth_controller.dart';
import 'package:reddit_flutter/features/post/comment_card.dart';
import 'package:reddit_flutter/features/post/post_controller.dart';
import 'package:reddit_flutter/models/post_model.dart';
import 'package:reddit_flutter/widget/error_text.dart';
import 'package:reddit_flutter/widget/loader.dart';
import 'package:reddit_flutter/widget/post_card.dart';

class CommentsScreen extends ConsumerStatefulWidget {
  final String postId;
  const CommentsScreen({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends ConsumerState<CommentsScreen> {
  final commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

  void addComment(Post post) {
    ref.read(postControllerProvider.notifier).addComment(
          context: context,
          text: commentController.text.trim(),
          post: post,
        );
    setState(() {
      commentController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;

    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(getPostByIdProvider(widget.postId)).when(
            data: (data) {
              return Column(
                children: [
                  PostCard(post: data),
                  if (!isGuest)
                    ref.watch(getPostCommentsProvider(widget.postId)).when(
                          data: (data) {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final comment = data[index];
                                  return CommentCard(comment: comment);
                                },
                              ),
                            );
                          },
                          error: (error, stackTrace) {
                            return ErrorText(
                              error: error.toString(),
                            );
                          },
                          loading: () => const Loader(),
                        ),
                ],
              );
            },
            error: (error, stackTrace) => ErrorText(
              error: error.toString(),
            ),
            loading: () => const Loader(),
          ),
    );
  }
}
