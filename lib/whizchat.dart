import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:projectattempt/home.dart';

class WhizChatPage extends StatefulWidget {
  @override
  _WhizChatPageState createState() => _WhizChatPageState();
}

class _WhizChatPageState extends State<WhizChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isTyping = false;
  late GenerativeModel _model;
  late ChatSession _chatSession;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  void _initializeChat() {
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: '', 
    );
    _chatSession = _model.startChat(history: [
      Content.text("Heyy, it's your Virtual Coach (Whiz) how can I help you? Would you like a prediction of your next big lift!")
    ]);

    setState(() {
      _messages.add({
        'text': "Heyy, it's your Virtual Coach (Whiz) how can I help you? Would you like a prediction of your next big lift!",
        'type': 'bot'
      });
    });
    _scrollToBottom();
  }

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add({'text': message, 'type': 'user'});
      _isTyping = true;
    });
    _controller.clear();
    _scrollToBottom();

    String query;
    if (message.toLowerCase().contains('yes')) {
      query = "Throughout the last month I lifted in order 30kgs, 32 kgs, 34 kgs, 36 kgs, 38 kgs, based on these numbers what do you predict I'll be able to lift and just give me the final answer and after how many days and due to what and what else would I be able to lift";
    } else {
      query = message;
    }

    final response = await _fetchGeminiResponse(query);

    if (response != null) {
      setState(() {
        _messages.add({'text': response, 'type': 'bot'});
        _isTyping = false;
      });
    } else {
      setState(() {
        _messages.add({'text': 'Error: Failed to fetch response', 'type': 'bot'});
        _isTyping = false;
      });
    }
    _scrollToBottom();
  }

  Future<String?> _fetchGeminiResponse(String prompt) async {
    try {
      final content = Content.text(prompt);
      final response = await _chatSession.sendMessage(content);
      return response.text;
    } catch (e) {
      print('Error fetching response: $e');
      return 'Error fetching response';
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF1C1A26),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1A26),
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage())
            );
          },
        ),
        title: Column(
          children: [
            SizedBox(height: 10),
            Icon(
              Icons.computer,
              color: Colors.purple,
              size: 30,
            ),
            SizedBox(height: 5),
            Text(
              'Whiz Chat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 100, // Increased height
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: constraints.maxWidth * 0.4,
                        height: constraints.maxWidth * 0.4,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, -3),
                            ),
                          ],
                          color: Colors.black.withOpacity(0.2), // Adjust opacity
                          borderRadius: BorderRadius.circular(constraints.maxWidth * 0.2),
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'), // Adjust path as necessary
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Color(0xFF1C1A26).withOpacity(0.6),
                              BlendMode.dstATop,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: _isTyping ? 30.0 : 0),
                      child: ListView.builder(
                        controller: _scrollController,
                        reverse: true,
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[_messages.length - 1 - index];
                          final isUser = message['type'] == 'user';
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: constraints.maxWidth * 0.1),
                            child: Align(
                              alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.7),
                                decoration: BoxDecoration(
                                  color: isUser ? Colors.purple : Colors.grey[800],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  message['text']!,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (_isTyping)
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1, vertical: 0),
                          child: Row(
                            children: [
                              Text(
                                'Whiz is typing...',
                                style: TextStyle(color: Colors.blue[100]),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1, vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF2C2C2E),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 22.5),
                                  hintText: 'Enter your message...',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                ),
                                onSubmitted: (value) {
                                  if (value.isNotEmpty) {
                                    _sendMessage(value);
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              icon: Icon(Icons.send, color: Colors.purple),
                              onPressed: () {
                                final message = _controller.text;
                                if (message.isNotEmpty) {
                                  _sendMessage(message);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
