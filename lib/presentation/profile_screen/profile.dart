import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_diary/presentation/utiles/constants.dart';
import 'package:url_launcher/link.dart';

class DetialPage extends StatefulWidget {
  final String? imageUrl;
  final String? browserUrl;
  final String? title;
  final String? name;
  final String? description;
  final String? content;
  final String? date;
  final String? auther;
  const DetialPage(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.name,
      required this.description,
      required this.content,
      this.date,
      this.browserUrl,
      this.auther});

  @override
  State<DetialPage> createState() => _DetialPageState();
}

class _DetialPageState extends State<DetialPage> {
  @override
  Widget build(BuildContext context) {
    String dateString = widget.date!;

    DateTime dateTime = DateTime.parse(dateString);

// Extracting only the date part

    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    final url = Uri.parse(widget.browserUrl ?? '');

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            color: kwhite,
          ),
        ),
        backgroundColor: kdark,
      ),
      backgroundColor: kdark,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: 'newsimage',
                          child: SizedBox(
                              width: double.infinity,
                              child: widget.imageUrl != null
                                  ? Image.network(
                                      widget.imageUrl ??
                                          'https://marsala-sa.com/wp-content/uploads/2013/10/placeholder_image2.png',
                                      fit: BoxFit.cover,
                                    )
                                  : const Image(
                                      image: AssetImage(
                                          'assets/images/placeholderimage.jpg'))),
                        ),
                        Positioned(
                          top: 80,
                          right: 10,
                          child: Text(
                            widget.name ?? '',
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.title ?? 'title not available',
                      style: const TextStyle(
                          fontSize: 20,
                          color: kwhite,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Reorted by : ${widget.auther}",
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white60,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      widget.description ?? 'Description not available',
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: kwhite,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      widget.content ?? 'Description not available',
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: kwhite,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Pubilshed At  ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white54,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1),
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: kwhite,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "   Go to this link for more information ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white54,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1),
                        ),
                        Link(
                          uri: url,
                          target: LinkTarget.defaultTarget,
                          builder: (context, followLink) => TextButton(
                            onPressed: followLink,
                            child: Center(
                              child: Text(
                                url.toString(),
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
