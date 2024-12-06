import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/wudu_practical_model.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/widgets/audio_icon.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/widgets/video_icon.dart';

import '../../../core/styles/text_styles.dart';

class WuduPracticalPage extends StatefulWidget {
  String jsonFile;

  WuduPracticalPage({required this.jsonFile, Key? key}) : super(key: key);

  @override
  State<WuduPracticalPage> createState() => _WuduPracticalPageState();
}

class _WuduPracticalPageState extends State<WuduPracticalPage> {
  late WuduPracticalModel wuduPracticalStep;
  late int selectedPage;
  bool isLoading = true;

  @override
  void initState() {
    selectedPage = 0;
    getData();
    super.initState();
  }

  void getData() async {
    wuduPracticalStep =
        await WuduStepsFromJson.getData(context, widget.jsonFile);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: 35.tEdge,
                color: AppColors.kPrimaryColor,
                child: StepPage(wuduPracticalStep: wuduPracticalStep),
              ),
      ),
    );
  }
/*
  Widget buildLessons(List<WuduPracticalStep> wuduSteps) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: wuduSteps.length,
        itemBuilder: (context, index) =>
            StepPage(wuduPracticalStep: wuduSteps[index]));
  }*/
}

class StepPage extends StatelessWidget {
  StepPage({required this.wuduPracticalStep, Key? key}) : super(key: key);
  WuduPracticalModel wuduPracticalStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 15.hEdge,
      //margin: EdgeInsets.only(top: context.height * 0.05),
      width: context.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
        color: AppColors.kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                wuduPracticalStep.header,
                style: Styles.textStyle24Green,
              ),
            ),
          ),
          10.hSize,
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: wuduPracticalStep.topics.length,
                  itemBuilder: (context, index) => TopicPage(
                        topic: wuduPracticalStep.topics[index],
                        index: index,
                      ))),
        ],
      ),
    );
  }
}

class TopicPage extends StatefulWidget {
  const TopicPage({required this.topic, required this.index, Key? key})
      : super(key: key);
  final NestedTopics topic;
  final int index;

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            backgroundColor: AppColors.kGoldenColor,
            child: Text((widget.index + 1).toString()),
          ),
        ),
        if (widget.topic.title != '0')
          Text(
            widget.topic.title,
            style: Styles.textStyle18Green,
          ),
        5.hSize,
        if (widget.topic.body != '0') Text(widget.topic.body),
        15.hSize,
        if (widget.topic.translation != '0') Text(widget.topic.translation),
        /*if (widget.topic.image != '0')
          Padding(
          padding: 20.vhEdge,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            // Image border
            child: SizedBox.fromSize(
                child: Image.asset(
                  widget.topic.image,
                  fit: BoxFit.fill,
                )),
          ),
        ),*/
        15.hSize,
        if (widget.topic.description != '0')
          Row(
            children: [
              Expanded(
                  child: Text(
                widget.topic.description,
                style: AppTextStyles.h5,
              )),
              if (widget.topic.transliteration == '0')
                AudioIcon(audioPath: widget.topic.audio)
            ],
          ),
        if (widget.topic.audio != '0' && widget.topic.transliteration != '0')
          AudioIcon(
              audioPath: widget.topic.audio,
              transliteration: widget.topic.transliteration,
              index: widget.index),
        10.hSize,
        if (widget.topic.video != '0') VideoIcon(videoPath: widget.topic.video),

        //50.hSize
      ],
    );
  }
}
