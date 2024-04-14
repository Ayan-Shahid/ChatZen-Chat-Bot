import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatzen/components/bot_bubble.dart';
import 'package:chatzen/components/prompt_input.dart';
import 'package:chatzen/components/user_bubble.dart';
import 'package:chatzen/theme/theme.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Map<String, String>> messages = [
    {
      "from": "bobo",
      "message": "Hello Andrew, I'm Bobo",
    },
    {
      "from": "user",
      "message": "I'm good, how about you!",
    },
  ];
  final TextEditingController controller = TextEditingController();
  late OpenAI openAI;

  Future<CompleteResponse?>? _translateFuture;
  void _translateEngToThai() async {
    final request = CompleteText(
        prompt: translateEngToThai(word: controller.text),
        maxTokens: 200,
        model: Gpt3TurboInstruct());

    setState(() {
      _translateFuture = openAI.onCompletion(request: request);
    });
  }

  sendMessage() async {
    _translateEngToThai();
    _translateFuture
        ?.then((value) => print(value?.id))
        .onError((error, stackTrace) => print("GPT Error $error"));
    setState(() {
      messages.add({"from": "user", "message": controller.text});
    });
  }

  @override
  void initState() {
    openAI = OpenAI.instance.build(
        token: "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",
        baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 20),
            connectTimeout: const Duration(seconds: 20)),
        enableLog: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    ThemeData theme = Theme.of(context);
    ChatZenPaletteExtension palettte = context.theme.palette;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: palettte.background,
      appBar: AppBar(
        backgroundColor: palettte.background,
        foregroundColor: palettte.foreground,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
        ],
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(
          "Bobo",
          style:
              theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(top: 8),
              itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 24),
                  alignment: messages[index]["from"] == "user"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: messages[index]["from"] == "user"
                      ? UserBubble(text: messages[index]["message"]!)
                      : BotBubble(text: messages[index]["message"]!)),
              itemCount: messages.length,
              shrinkWrap: true,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(child: PromptInput(controller: controller)),
                const SizedBox(
                  width: 16,
                ),
                IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      elevation: 0.0,
                      backgroundColor: palettte.primary,
                      shape: const CircleBorder(),
                    ),
                    icon: Icon(
                      Icons.send,
                      color: palettte.onPrimary,
                      size: 20,
                    )),
              ],
            )
          ],
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
