import 'package:e_learning_app/core/helper/custom_loading.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_back_button.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:e_learning_app/features/my_courses_videos/data/model/course_videos_model.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key, required this.videoModel});
  final CourseVideosModel videoModel;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.networkUrl(
              Uri.parse(widget.videoModel.videoUrl),
            )
            ..initialize().then((_) {
              setState(() {});
            }),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = flickManager.flickVideoManager?.videoPlayerController;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Videos ${widget.videoModel.title}",
          style: AppTextStyle.font24WhiteW600,
        ),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColorBlue,
        leading: Navigator.canPop(context)
            ? const CustomBackButton()
            : const SizedBox.shrink(),
      ),
      body: controller == null || !controller.value.isInitialized
          ? customLoading()
          : controller.value.hasError
          ? const Center(child: CustomText(title: "Something Error"))
          : Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: FlickVideoPlayer(flickManager: flickManager),
              ),
            ),
    );
  }
}
