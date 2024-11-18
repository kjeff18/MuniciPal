import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomAppBar.dart';

class ReportPage extends StatefulWidget {
  final String iconPath;
  final String reportName;
  const ReportPage({super.key, required this.iconPath, required this.reportName});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Report'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(widget.iconPath, width: 100, height: 100,),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.reportName,
                    textAlign: TextAlign.center,
                    style: textFont.copyWith(
                      fontSize: HeadlineSize,
                      color: accentColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: textFont.copyWith(
                    fontSize: bodyTextSize,
                    color: accentColor,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${_controller.text.length}/200)',
                  style: textFont.copyWith(
                    fontSize: bodyTextSize,
                    color: accentColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 150,
              child: TextField(
                controller: _controller,
                maxLines: 5,
                maxLength: 200,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: "Enter your text here...",
                  border: OutlineInputBorder(
          
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: accentColor,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  counterText: "",
                ),
                onChanged: (text) {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
