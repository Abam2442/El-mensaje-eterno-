import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_strings.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/salah_practical_steps/salah_practical_step.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/audio_icon.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/call_me.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/video_icon.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../../core/styles/text_styles.dart';

class SalahPracticalPage extends StatefulWidget {
  String jsonFile;

  SalahPracticalPage({required this.jsonFile, Key? key}) : super(key: key);

  @override
  State<SalahPracticalPage> createState() => _SalahPracticalPageState();
}

class _SalahPracticalPageState extends State<SalahPracticalPage> {
  late List<SalahPracticalStep> steps;
  late int selectedPage;
  late int porquselectedPage;
  late var firstPageData;
  var secondPageData;
  var lastPageData;
  bool isLoading = true;
  late final PageController _pageController;
  late final PageController _porqupageController;

  @override
  void initState() {
    print('in salah practical page');
    selectedPage = 0;
    porquselectedPage = 0;
    steps = [];
    _pageController = PageController(initialPage: selectedPage);
    _porqupageController = PageController(initialPage: porquselectedPage);
    if (steps.isEmpty) {
      getData();
    }
    super.initState();
  }

  void getData() async {
    List<dynamic> body = await SalahStepsFromJson.getData(context, widget.jsonFile);
    firstPageData = body[0];
    secondPageData = body[1];
    lastPageData = body.last;
    body.removeRange(0, 2);
    body.removeLast();
    steps =  body.map<SalahPracticalStep>(SalahPracticalStep.fromJson).toList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageCount = steps.length;
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: AppColors.kPrimaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          _pageController.animateToPage(0,duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                        }, icon: const Icon(Icons.first_page),color:AppColors.kGreenColor,),
                        IconButton(onPressed: (){
                          _pageController.previousPage(duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                        }, icon: const Icon(Icons.arrow_back),color:AppColors.kGreenColor,),
                        Row(children: [
                          Text('${selectedPage+1}',style: AppTextStyles.h5white,),
                          Text('/',style: AppTextStyles.h5white,),
                          Text('${pageCount+3}',style: AppTextStyles.h5white,)
                        ],),
                        IconButton(onPressed: (){
                          _pageController.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                        }, icon: const Icon(Icons.arrow_forward),color: AppColors.kGreenColor,),
                        IconButton(onPressed: (){
                          _pageController.animateToPage(pageCount+2,duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                        }, icon: const Icon(Icons.last_page),color:AppColors.kGreenColor,),
                      ],
                    ),
                    Expanded(
                      child: PageView(
                        //physics: BouncingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            selectedPage = page;
                          });
                        },
                        children:
                          List.generate(pageCount+3, (index) {
                            if(index == 0){
                              return _buildFirstPage();
                            }
                            if(index == 1){
                              return _buildSecondPage();
                            }
                            if(index == pageCount+2){
                              return _buildLastPage();
                            }
                          return StepPage(salahPracticalStep: steps[index-2]);
                        }),
                      ),
                    ),
                    /*DotsIndicator(
                      length: pageCount,
                      pageController: _pageController,
                      selectedPage: selectedPage,
                    )*/
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildFirstPage(){
    return Container(
        padding: 15.hEdge,
        //margin: EdgeInsets.only(top: context.height * 0.05),
        width: context.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
          color: AppColors.kWhiteColor,
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            10.sSize,
            Text(
              firstPageData['Rakaa'],
              style: Styles.textStyle24Green,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    2.hSize,
                    Text(
                      firstPageData['description1'],
                      style: AppTextStyles.h5,
                    ),
                    5.hSize,
                    _buildImage(firstPageData['image1']),
                    5.hSize,
                    _buildImage(firstPageData['image2']),
                    Text(
                      firstPageData['description2'],
                      style: AppTextStyles.h5,
                    ),
                    5.hSize,
                    _buildImage(firstPageData['image3']),
                    5.hSize,
                    _buildImage(firstPageData['image4']),
                    Text(
                      firstPageData['description3'],
                      style: AppTextStyles.h5,
                    ),
                    5.hSize,
                    _buildImage(firstPageData['image5']),
                    5.hSize,
                    _buildImage(firstPageData['image6']),
                    Text(
                      firstPageData['description4'],
                      style: AppTextStyles.h5,
                    ),
                  Center(child: VideoIcon(videoPath: firstPageData['Video3'])),
                    Text(
                      firstPageData['description5'],
                      style: AppTextStyles.h5,
                    ),
                    Text(
                      firstPageData['description6'],
                      style: AppTextStyles.h5,
                    ),
                    Center(child: InkWell(
                      onTap: (){
                        List<Widget> list = [
                          _buildporquPage(firstPageData['Porque1']),
                          _buildporquPage(firstPageData['Porque2']),
                          _buildporquPage(firstPageData['Porque3']),
                          _buildporquPage(firstPageData['Porque4']),
                          _buildporquPage(firstPageData['Porque5'])
                        ];
                        Get.to(()=>PageView(
                          controller: _porqupageController,
                          onPageChanged: (page) {
                            setState(() {
                              porquselectedPage = page;
                            });
                          },
                          children: List.generate(list.length, (index) {
                            return Scaffold(
                              backgroundColor: AppColors.kPrimaryColor,
                              body: SafeArea(
                                child: Padding(
                                  padding: 35.tEdge,
                                  child: Container(
                                    height: context.height,
                                    //margin: EdgeInsets.only(top: context.height * 0.05),
                                    width: context.width,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
                                      color: AppColors.kGreenColor,
                                    ),
                                    //margin: 20.aEdge,
                                    child: Padding(
                                      padding: 20.aEdge,
                                        child: SingleChildScrollView(child:list[index])),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ) );
                      }, child: const Icon(Icons.question_mark,size: 100,color: Colors.green,))),
                    Text(
                      firstPageData['description7'],
                      style: AppTextStyles.h5,
                    ),Text(
                      firstPageData['description8'],
                      style: AppTextStyles.h5,
                    ),
                    CallMe(
                        whatsapp: AppStrings.whatsappUrl,
                        messenger: AppStrings.messengerUrl,
                        message: '')
                  ],
                ),
              ),
            ),
          ],
        )


    );
  }
  Widget _buildporquPage(String text){
    return Text(text,style: AppTextStyles.h5,);
  }

  Widget _buildImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      // Image border
      child: SizedBox.fromSize(
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          )),
    );
  }

  Widget _buildSecondPage(){
    return Container(
        padding: 15.hEdge,
        //margin: EdgeInsets.only(top: context.height * 0.05),
        width: context.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
          color: AppColors.kWhiteColor,
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.hSize,
            Text(
              secondPageData['Rakaa'],
              style: Styles.textStyle24Green,
            ),
            Expanded(
              child: Text(
                    secondPageData['description'],
                    style: AppTextStyles.h5,
              ),
            ),
          ],
        )


    );
  }

  Widget _buildLastPage(){
    return Container(
        padding: 15.hEdge,
        //margin: EdgeInsets.only(top: context.height * 0.05),
        width: context.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
          color: AppColors.kWhiteColor ,
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.hSize,
            Text(
              lastPageData['Rakaa'],
              style: Styles.textStyle24Green,
            ),
            Expanded(
              child: SingleChildScrollView(child:

              Column(
                children: [
                  VideoIcon(videoPath:lastPageData['Video1']),
                  VideoIcon(videoPath:lastPageData['Video2']),
                  VideoIcon(videoPath:lastPageData['Video3']),
                  VideoIcon(videoPath:lastPageData['Video4']),
                  VideoIcon(videoPath:lastPageData['Video5'])
                ],
              )
              ),
            ),
          ],
        )


    );
  }

  /*Widget buildLessons(List<SalahPracticalStep> fajrSteps) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: fajrSteps.length,
        itemBuilder: (context, index) =>
            StepPage(salahPracticalStep: fajrSteps[index]));
  }*/
}

class StepPage extends StatelessWidget {
  StepPage({required this.salahPracticalStep, Key? key}) : super(key: key);
  SalahPracticalStep salahPracticalStep;

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
      child:Column(
        children: [
          10.sSize,
          Text(
            salahPracticalStep.rakaa,
            style: Styles.textStyle24Green,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  2.hSize,
                  Text(
                    salahPracticalStep.stepName,
                    style: Styles.textStyle24Green,
                  ),
                  5.hSize,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      swap(salahPracticalStep),
                      15.hSize,
                      Row(
                        children: [
                          Expanded(child: Text(salahPracticalStep.description, style: AppTextStyles.h5)),
                          AudioIcon(audioPath: salahPracticalStep.descriptionaudio),
                        ],
                      ),
                      50.hSize,
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: salahPracticalStep.topics.length,
                          itemBuilder: (context, index) => TopicPage(
                            topic: salahPracticalStep.topics[index],
                            index: index,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )


    );
  }
}

class TopicPage extends StatefulWidget {
  TopicPage({required this.topic, required this.index, Key? key})
      : super(key: key);
  final Topic topic;
  final int index;

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  //AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (AppPublicVar.assetsAudioPlayer.isPlaying.value) {
      AppPublicVar.assetsAudioPlayer.stop();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AudioIcon(
            audioPath: widget.topic.audioTopic,
            transliteration: widget.topic.transliteration,
            index: widget.index),
        15.hSize,
        Text(widget.topic.body, style: AppTextStyles.h5),
        15.hSize,
        Text(widget.topic.translation, style: AppTextStyles.h5),
        15.hSize,
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (widget.topic.videoTopic != '0')
            VideoIcon(videoPath: widget.topic.videoTopic),
          10.wSize,
          CallMe(
            whatsapp: AppStrings.whatsappUrl,
              messenger: AppStrings.messengerUrl,
              message: widget.topic.body),
        ]),
        15.hSize,
        Row(children: [
          if (widget.topic.descriptiontopic != '0')
            Expanded(child: Text(widget.topic.descriptiontopic, style: AppTextStyles.h5)),
          if(widget.topic.descriptiontopicaudio != null && widget.topic.descriptiontopicaudio != '0' )
            AudioIcon(audioPath: widget.topic.descriptiontopicaudio! ),
        ],),
        Row(children: [
          if(widget.topic.fin != null)
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: 10.cBorder,
                      color: Colors.redAccent
                  ),
                  child: Text(widget.topic.fin!, style: AppTextStyles.h5)),
            ),
          if(widget.topic.finaudio != null)
            AudioIcon(audioPath: widget.topic.finaudio! ),
        ],),
        
        50.hSize
      ],
    );
  }
}

class swap extends StatefulWidget {
  SalahPracticalStep salahPracticalStep;

  @override
  State<swap> createState() => _swapState();
  swap(this.salahPracticalStep);
}

class _swapState extends State<swap> {
  List<Widget> pages = [];
  int index = 0;
  late int selectedPage;
  late final PageController _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);
    super.initState();
  }

  void extraImage(String? path,int index){
    if(path == null || path == ''){
      switch(index){
        case 3:if(pages.length>3){
          pages.removeAt(3);
          pages.removeAt(4);
          pages.removeAt(5);
          pages.removeAt(6);
          pages.removeAt(7);}
          break;
        case 4:if(pages.length>4){
          pages.removeAt(4);
          pages.removeAt(5);
          pages.removeAt(6);
          pages.removeAt(7);}
          break;
        case 5:
          if(pages.length>5){

          pages.removeAt(5);
          pages.removeAt(6);
          pages.removeAt(7);}
          break;
        case 6:
          if(pages.length>6){

            pages.removeAt(6);
            pages.removeAt(7);
          }
          break;
        case 7:
          if(pages.length>7){
            pages.removeAt(7);
          }
          break;
      }
    }else{
      pages.add(getB(path));
    }
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      if(widget.salahPracticalStep.video2!='')
        VideoIcon(videoPath: widget.salahPracticalStep.video2),
      VideoIcon(videoPath: widget.salahPracticalStep.video),
      getB(widget.salahPracticalStep.image),
    ];
      extraImage(widget.salahPracticalStep.image2,3);
      extraImage(widget.salahPracticalStep.image3,4);
      extraImage(widget.salahPracticalStep.image4,5);
      extraImage(widget.salahPracticalStep.image5,6);
      extraImage(widget.salahPracticalStep.image6,7);

    return SizedBox(
      height: context.height * 0.4,
      width: context.width * 0.7,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                });
              },
              children: List.generate(pages.length, (index) {
                return pages[index];
              }),
            ),
          ),
          DotsIndicator(
            length: pages.length,
            pageController: _pageController,
            selectedPage: selectedPage,
          )
        ],
      ),
    );
  }

  Widget getB(String imagePath) {
    return InkWell(
      onTap: () {
        showGeneralDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.6),
            pageBuilder: (_, __, ___) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: context.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        // Image border
                        child: SizedBox.fromSize(
                            size: Size.fromRadius(context.width * 0.5),
                            // Image radius
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          AppRoutes.pop(context);
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                          size: 50,
                        ))
                  ],
                ),
              );
            });
      },
      child: Padding(
        padding: 20.vhEdge,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          // Image border
          child: SizedBox.fromSize(
              child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          )),
        ),
      ),
    );
  }
}

class DotsIndicator extends StatelessWidget {
  DotsIndicator({
    required this.pageController,
    required this.length,
    required this.selectedPage,
    });
  int selectedPage;
  int length;
  PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: PageViewDotIndicator(
        currentItem: selectedPage,
        count: length,
        unselectedColor: Colors.black26,
        selectedColor: Colors.blue,
        duration: const Duration(milliseconds: 200),
        boxShape: BoxShape.circle,
        fadeEdges: false,
        onItemClicked: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
