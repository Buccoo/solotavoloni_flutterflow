// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_drawing/path_drawing.dart';
import 'package:xml/xml.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<Country> maps = [];
late Country currentCountry;
late String svgImage =
    '<?xml version="1.0" encoding="UTF-8"?> <svg data-name="Layer 1" version="1.1" viewBox="0 0 900 1600" xmlns="http://www.w3.org/2000/svg"><path id="tuobasso" d="m332.84 708.49 45.018 5.658 28.782-53.383 110.95-26.322 27.798-25.338-134.32 7.8721z" fill="#008080"/><path id="tuoopen" d="m192.37 776.88c6.8881 0 60.517-1.968 60.517-1.968l4.9034-37.882 33.398-92.367 83.844-77.756 99.847-28.702-6.958-56.186-130.64 38.095-98.978 95.325-41.748 117.59z" fill="#008080"/><path id="tuoring" d="m255.84 737.52c2.952 0.492 13.776 2.46 13.776 2.46l12.792-38.868 51.661 6.8881 78.229-91.513 131.37-7.3801 48.216-43.788-117.1-28.044-100.86 28.044-84.133 78.229z" fill="#008080" opacity=".64439"/><path id="mioring" transform="translate(.492)" d="m251.91 773.68 68.881 8.6101 31.734 96.679 80.935 53.383h9.8401v48.462s46.248 8.3641 46.248 9.5941v13.038l-110.95-24.6-96.187-95.695z" fill="#008080" opacity=".73508"/><path id="miobasso" d="m321.03 781.55 40.429 6.2889 83.064 122.76-0.98011 26.917-10.291-0.25155-80.859-54.588z" fill="#008080" stroke-width="1.0092"/><path  id="consolle" d="m622.72 661.81c-21.457-25.947-39.056-47.236-39.109-47.309-0.10367-0.14454 2.8569-2.8147 29.302-26.428 9.674-8.638 17.921-15.909 18.327-16.158 0.45635-0.27999 1.2074-0.45346 1.968-0.45453 1.2152-2e-3 1.2518 0.0212 3.0411 1.9056 1.2868 1.3551 73.165 83.531 76.479 87.436 0.42218 0.49745 0.67336 2.1525 0.45732 3.0133-0.0863 0.34394-0.49767 1.0134-0.9141 1.4877-0.41643 0.47429-5.5348 4.9991-11.374 10.055s-16.905 14.639-24.59 21.295c-7.6854 6.6563-14.109 12.154-14.274 12.218-0.17258 0.0662-16.9-19.957-39.314-47.061z" fill="#008080" stroke="#000" stroke-width=".246"/><path id="franoipasserella" d="m714.78 660.58c-0.85208-0.41966-2.8598-2.6979-56.063-63.615-25.235-28.894-23.747-27.003-22.736-28.889 0.25203-0.47061 4.6064-4.3838 10.516-9.4507l10.086-8.6475 0.15884 1.1105c0.0874 0.61076 0.3282 1.4318 0.53519 1.8246 0.65618 1.2452 77.382 89.862 78.146 90.257 0.39915 0.2064 1.1057 0.45733 1.57 0.5576l0.8443 0.18232-9.4488 8.2411c-5.1968 4.5326-9.7521 8.3745-10.123 8.5375-0.96257 0.42324-2.504 0.37542-3.4858-0.10813z" fill="#008080" fill-opacity=".7228" stroke="#000" stroke-width=".246"/><path id="dongio" d="m125.46 720.3c-30.739-0.47291-32.115-0.57552-35.441-2.6446-4.7907-2.9798-7.3935-5.9543-9.7406-11.132-1.9926-4.3953-2.0076-5.5556-2.0291-156.84-0.01601-112.87 0.27464-153.4 1.1204-156.22 1.4788-4.9356 6.8462-11.159 12.002-13.917l4.0763-2.1801 247.45-0.25365c271.83-0.27865 253.34-0.67754 260.95 5.6307 1.9809 1.6416 4.6377 5.0885 5.904 7.6599 2.2778 4.6254 2.3056 5.0874 2.601 43.298 0.18316 23.694-0.0594 38.622-0.62753 38.622-0.50936 0-34.413-8.1216-75.342-18.048l-74.416-18.048-151.02 47.874-111.64 112.7-20.625 61.85c-11.344 34.017-20.763 61.914-20.932 61.993-0.16888 0.0787-14.698-0.0783-32.287-0.34895z" fill="#008080" fill-opacity=".96373" opacity=".73508" stroke-opacity=".68877" stroke-width=".98401"/><path id="martinilounge" d="m90.237 1060.6c-4.6003-2.2771-8.1469-6.3124-10.502-11.949-1.3307-3.1849-1.5053-21.372-1.4968-155.91l0.0096-152.31 2.378-5.1074c2.8805-6.1868 8.4685-10.553 15.413-12.042 2.8565-0.6126 16.835-1.0549 33.342-1.0549h28.423l-1.8768 5.6581c-1.77 5.3364-5.8663 43.762-5.8663 55.029 0 2.9462 7.8315 30.474 23.37 82.147l23.37 77.716 61.815 57.745c33.998 31.76 63.002 58.739 64.453 59.954l2.6372 2.2092h-231.24z" fill="#008080" fill-opacity=".96373" opacity=".73508" stroke="#000" stroke-opacity=".68877" stroke-width=".98401"/><path id="tuobasso" d="m332.84 708.49 45.018 5.658 28.782-53.383 110.95-26.322 27.798-25.338-134.32 7.8721z" fill="#008080"/><path id="franoi" d="m736.46 642.24c-0.74312-0.31606-77.244-88.612-78.003-90.029-0.51276-0.95811-0.49131-2.5028 0.0478-3.4407 0.33182-0.57733 40.412-35.235 52.783-45.642 16.198-13.626 38.612-19.08 59.437-14.461 12.479 2.7676 23.601 8.6661 32.715 17.351 4.3884 4.1814 40.826 44.764 40.488 45.094-3.1722 3.0907-82.659 72.141-83.327 72.387-0.5262 0.19331-0.95673 0.55196-0.95673 0.797 0 0.24505-4.1878 4.0929-9.3063 8.5507s-9.6361 8.397-10.039 8.7536c-0.86585 0.76602-2.7891 1.0867-3.8391 0.64014zm7.6644-10.244c1.2088-0.5051 56.783-48.349 58.418-50.293 1.2499-1.4854 1.3216-4.1905 0.1549-5.8408-1.2658-1.7904-9.0571-10.695-9.9681-11.392-1.091-0.83514-3.8305-1.0984-4.9903-0.47951-0.48859 0.26069-13.807 11.642-29.595 25.292-19.908 17.212-28.845 25.15-29.156 25.901-0.65806 1.5887-0.4655 3.6604 0.4602 4.9516 0.43945 0.61293 2.8124 3.4209 5.2733 6.2399 5.3241 6.099 6.5306 6.8201 9.4031 5.6199zm-47.284-80.483c9.0743-7.6101 16.505-13.993 16.513-14.184 0.0188-0.46772-12.2-14.981-12.53-14.883-0.14294 0.0423-2.7815 2.1077-5.8634 4.59l-5.6036 4.5132 1.1044 1.2578c0.93816 1.0685 1.0308 1.326 0.61548 1.7106-0.2689 0.249-2.7413 2.3632-5.4942 4.6982l-5.0053 4.2455-1.1796-1.1434c-1.0808-1.0476-1.2444-1.1029-1.9527-0.66076-1.4835 0.92607-10.706 8.8394-10.61 9.1045 0.0529 0.14698 2.9141 3.5651 6.3583 7.5958 3.6709 4.296 6.4458 7.259 6.706 7.1605 0.24407-0.0924 7.8682-6.3945 16.942-14.005zm119.16 12.066c11.734-1.859 17.921-15.042 11.82-25.186-3.4293-5.7008-10.436-8.9906-16.875-7.9235-8.3492 1.3835-14.151 8.1951-14.122 16.58 0.032 9.2808 6.6735 16.106 16.394 16.847 0.28701 0.0219 1.5394-0.12141 2.7832-0.31845z" fill="#116f6f" fill-opacity=".96373" stroke="#000" stroke-width=".3479"/> <path fill="#116f6f" fill-opacity=".96373" stroke="#000" stroke-width=".3479" d="m 230.30982,912.19386 51.8371,-28.1799 96.71621,94.28091 -29.91941,51.48923 z" id="mioopen"/><path fill="#116f6f" fill-opacity=".96373" stroke="#000" stroke-width=".3479" d="m760.41002,690.87845-1.36466,157.61643-50.83361,-13.480350.68233,-127.54487z" id="franoiopen"/>  <g     transform="translate(109.21 1140.79) scale(1 1.02)">    <text       transform="translate(0 0)"       id="text146"><tspan         x="0"         y="0"         id="tspan146">CUBE HALL</tspan></text>    <g       id="g1">      <path         d="m433.51,1358.7v-99.02c0-5.65,4.58-10.23,10.23-10.23h346.67c9.35,0,16.93,7.58,16.93,16.93v42.99c0,9.35-7.58,16.93-16.93,16.93h-221.01v32.39c0,5.65-4.58,10.23-10.23,10.23h-115.44c-5.65,0-10.23-4.58-10.23-10.23h0Z"         id="path45" />      <text         transform="scale(0.99014754,1.0099505)"         id="text139"><tspan           x="595.21442"           y="1279.936"           id="tspan139">GUARDAROBA</tspan></text>      <text         transform="scale(0.99014754,1.0099505)"         id="text141"         x="465.672"         y="1337.8379"><tspan           x="465.672"           y="1337.8379"           id="tspan141">INGRESSO</tspan></text>      <rect         x="446.35703"         y="1333.3271"         width="115.19398"         height="24.825861"         rx="6.6817856"         ry="5.9869442"         id="rect147" />      <rect         x="577.69464"         y="1274.8846"         width="137.79279"         height="24.560602"         rx="6.8810377"         ry="5.9830947"         id="rect148" />    </g>    <g       id="g3">      <rect         x="549.39"         y="1437.62"         width="245.82"         height="56.1"         rx="28.05"         ry="28.05"         id="rect183" />      <circle         cx="769.47803"         cy="1456.8101"         r="10.02"         id="circle183" />    </g>    <text       transform="matrix(0.96,0,0,1.02,93.76,217.77)"       id="text138"><tspan         x="0"         y="0"         id="tspan137">CROMIE</tspan><tspan         x="0"         y="102.8"         id="tspan138">MAP</tspan></text>    <g       id="g18">      <text         transform="matrix(0.76,0,0,1.02,579.54,1484.33)"         id="text140"><tspan           x="0"           y="0"           id="tspan140">CRM2324</tspan></text>      <text         transform="matrix(1,0,0,1.02,763.69,1462.1)"         id="text142"><tspan           x="0"           y="0"           id="tspan142">S</tspan></text>    </g>    <text       transform="matrix(1,0,0,1.02,90.59,1480.5)"       id="text144"><tspan         x="0"         y="0"         id="tspan144">WWW.MUSICAEPAROLE.IT</tspan></text>    <rect       x="206.21709"       y="1331.0671"       width="145.90608"       height="24.195833"       rx="7.2111735"       ry="5.9767389"       id="rect146" />    <g       id="g101">      <rect         x="515.14"         y="596.64"         width="97.95"         height="29.21"         transform="translate(-263.9 532.18) rotate(-41.84)"         id="rect90" />      <rect         x="515.14"         y="596.64"         width="97.95"         height="29.21"         transform="translate(-263.9 532.18) rotate(-41.84)"         id="rect91" />      <line         x1="586.04"         y1="572.26"         x2="605.22"         y2="593.68"         id="line91" />      <line         x1="580.38"         y1="577.33"         x2="599.56"         y2="598.74"         id="line92" />      <line         x1="574.72"         y1="582.4"         x2="593.9"         y2="603.81"         id="line93" />      <line         x1="563.41"         y1="592.53"         x2="582.58"         y2="613.94"         id="line94" />      <line         x1="557.75"         y1="597.6"         x2="576.92"         y2="619.01"         id="line95" />      <line         x1="552.09"         y1="602.66"         x2="571.27"         y2="624.08"         id="line96" />      <line         x1="546.43"         y1="607.73"         x2="565.61"         y2="629.15"         id="line97" />      <line         x1="540.77"         y1="612.8"         x2="559.95"         y2="634.21"         id="line98" />      <line         x1="535.11"         y1="617.86"         x2="554.29"         y2="639.28"         id="line99" />      <line         x1="529.45"         y1="622.93"         x2="548.63"         y2="644.35"         id="line100" />      <line         x1="523.8"         y1="628"         x2="542.97"         y2="649.41"         id="line101" />      <polyline         points="588.71 608.54 569.53 587.12 469.77 562.36 384.07 589.96 314.5 656.88 298.6 703.04"         id="polyline101" />    </g>    <g       id="g112">      <rect         x="290.83"         y="708.87"         width="35.69"         height="107.53"         transform="translate(-484.71 980.44) rotate(-83.32)"         id="rect101" />      <rect         x="290.83"         y="708.87"         width="35.69"         height="107.53"         transform="translate(-484.71 980.44) rotate(-83.32)"         id="rect102" />      <line         x1="356.9"         y1="750.55"         x2="352.81"         y2="785.43"         id="line102" />      <line         x1="348.62"         y1="749.58"         x2="344.53"         y2="784.46"         id="line103" />      <line         x1="340.33"         y1="748.61"         x2="336.25"         y2="783.49"         id="line104" />      <line         x1="323.77"         y1="746.67"         x2="319.68"         y2="781.55"         id="line105" />      <line         x1="315.49"         y1="745.7"         x2="311.4"         y2="780.58"         id="line106" />      <line         x1="307.21"         y1="744.73"         x2="303.12"         y2="779.61"         id="line107" />      <line         x1="298.92"         y1="743.76"         x2="294.83"         y2="778.64"         id="line108" />      <line         x1="290.64"         y1="742.79"         x2="286.55"         y2="777.67"         id="line109" />      <line         x1="282.36"         y1="741.82"         x2="278.27"         y2="776.7"         id="line110" />      <line         x1="274.08"         y1="740.85"         x2="269.99"         y2="775.73"         id="line111" />      <line         x1="265.79"         y1="739.88"         x2="261.71"         y2="774.76"         id="line112" />      <polyline         points="328.58 782.67 332.67 747.78 332.67 747.78"         id="polyline112" />    </g>    <g       id="g124">      <rect         x="613.56"         y="714.21"         width="97.95"         height="29.21"         transform="translate(-315.49 612.19) rotate(-40.93)"         id="rect112" />      <rect         x="613.56"         y="714.21"         width="97.95"         height="29.21"         transform="translate(-315.49 612.19) rotate(-40.93)"         id="rect113" />      <line         x1="685.08"         y1="690.19"         x2="703.91"         y2="711.9"         id="line113" />      <line         x1="679.34"         y1="695.16"         x2="698.17"         y2="716.88"         id="line114" />      <line         x1="673.6"         y1="700.14"         x2="692.43"         y2="721.86"         id="line115" />      <line         x1="667.86"         y1="705.11"         x2="686.7"         y2="726.83"         id="line116" />      <line         x1="662.13"         y1="710.09"         x2="680.96"         y2="731.81"         id="line117" />      <line         x1="656.39"         y1="715.07"         x2="675.22"         y2="736.78"         id="line118" />      <line         x1="650.65"         y1="720.04"         x2="669.48"         y2="741.76"         id="line119" />      <line         x1="644.91"         y1="725.02"         x2="663.74"         y2="746.74"         id="line120" />      <line         x1="639.17"         y1="729.99"         x2="658"         y2="751.71"         id="line121" /> <line         x1="633.43"         y1="734.97"         x2="652.26"         y2="756.69"         id="line122" />      <line         x1="627.69"         y1="739.94"         x2="646.52"         y2="761.66"         id="line123" />      <line         x1="621.95"         y1="744.92"         x2="640.78"         y2="766.64"         id="line124" />    </g>    <polyline       points="760.53 730.13 760.53 692.59 742.71 672.12 775.84 642.67 760.23 623.83"       id="polyline58"       opacity="1" />    <polyline       points="706.07 935.55 757.8 850.87 758.4 777.96"       id="polyline57"       opacity="1" />  </g></svg>';

class CromieMapCopy extends StatefulWidget {
  const CromieMapCopy({
    Key? key,
    this.width,
    this.height,
    this.bgColor,
    required this.franoipasserella,
    required this.franoi,
    required this.franoiopen,
    required this.consolle,
    required this.martinilounge,
    required this.mioopen,
    required this.mioring,
    required this.miobasso,
    required this.tuobasso,
    required this.tuoring,
    required this.tuoopen,
    required this.dongio,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? bgColor;
  final Future<dynamic> Function() franoipasserella;
  final Future<dynamic> Function() franoi;
  final Future<dynamic> Function() franoiopen;
  final Future<dynamic> Function() consolle;
  final Future<dynamic> Function() martinilounge;
  final Future<dynamic> Function() mioopen;
  final Future<dynamic> Function() mioring;
  final Future<dynamic> Function() miobasso;
  final Future<dynamic> Function() tuobasso;
  final Future<dynamic> Function() tuoring;
  final Future<dynamic> Function() tuoopen;
  final Future<dynamic> Function() dongio;

  @override
  State<CromieMapCopy> createState() => _MainCode();
}

class _MainCode extends State<CromieMapCopy> {
  @override
  initState() {
    super.initState();
    loadSvgImage();
    currentCountry = maps.firstWhere((x) => x.id == "consolle");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: InteractiveViewer(
          scaleEnabled: false,
          panEnabled: false,
          maxScale: 0.2,
          minScale: 0.2,
          child: Stack(
            children: [
              for (var country in maps)
                _getClippedImage(
                  clipper: Clipper(
                    svgPath: country.path,
                  ),
                  color: widget.bgColor!.withOpacity(currentCountry == null
                      ? 0.5
                      : currentCountry?.id == country.id
                          ? 1.0
                          : 0.5),
                  country: country,
                  onCountrySelected: (selectedCountry) {
                    currentCountry = selectedCountry;
                    // if (selectedCountry.id == "consolle") {
                    //   widget.consolle!();
                    // } else if (selectedCountry.id == "franoipasserella") {
                    //   widget.franoipasserella!();
                    // } else if (selectedCountry.id == "franoi") {
                    //   widget.franoi!();
                    // } else if (selectedCountry.id == "franoiopen") {
                    //   widget.franoiopen!();
                    // } else if (selectedCountry.id == "dongio") {
                    //   widget.dongio!();
                    // } else if (selectedCountry.id == "tuobasso") {
                    //   widget.tuobasso!();
                    // } else if (selectedCountry.id == "tuoring") {
                    //   widget.tuoring!();
                    // } else if (selectedCountry.id == "tuoopen") {
                    //   widget.tuoopen!();
                    // } else if (selectedCountry.id == "martinilounge") {
                    //   widget.martinilounge!();
                    // } else if (selectedCountry.id == "miobasso") {
                    //   widget.miobasso!();
                    // } else if (selectedCountry.id == "mioring") {
                    //   widget.mioring!();
                    // } else if (selectedCountry.id == "mioopen") {
                    //   widget.mioopen!();
                    // }
                    Map<String, void Function()> countryWidgetMap = {
                      "consolle": () => widget.consolle!(),
                      "franoipasserella": () => widget.franoipasserella!(),
                      "franoi": () => widget.franoi!(),
                      "franoiopen": () => widget.franoiopen!(),
                      "dongio": () => widget.dongio!(),
                      "tuobasso": () => widget.tuobasso!(),
                      "tuoring": () => widget.tuoring!(),
                      "tuoopen": () => widget.tuoopen!(),
                      "martinilounge": () => widget.martinilounge!(),
                      "miobasso": () => widget.miobasso!(),
                      "mioring": () => widget.mioring!(),
                      "mioopen": () => widget.mioopen!(),
                    };

                    void Function()? selectedWidgetFunction =
                        countryWidgetMap[selectedCountry.id];
                    selectedWidgetFunction?.call();
                    setState(() {});
                  },
                ),
              // Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(
              //           "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/solotavoloni-i2l1gq/assets/lt57cr58lmzm/cromie-mod-cleaned.svg"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Country>> loadSvgImage() async {
  String generalString = svgImage;

  XmlDocument document = XmlDocument.parse(generalString);
  final paths = document.findAllElements('path')!;

  for (var element in paths) {
    String partId = element.getAttribute('id').toString();
    String partPath = element.getAttribute('d').toString();

    if (partId != "null") {
      print(partId);
      maps.add(Country(id: partId, path: partPath));
    }
  }

  return maps;
}

class Country {
  String id;
  String path;
  Country({
    required this.id,
    required this.path,
  });

  factory Country.fromXmlElement(XmlElement element) {
    return Country(
      id: element.getAttribute('id') ?? '',
      path: element.getAttribute('path') ?? '',
    );
  }
}

Widget _getClippedImage({
  required CustomClipper<Path> clipper,
  required Country country,
  required Color color,
  final Function(Country country)? onCountrySelected,
}) {
  return ClipPath(
    clipper: clipper,
    child: GestureDetector(
      onTap: () => onCountrySelected?.call(country),
      child: Container(
        color: color,
      ),
    ),
  );
}

class Clipper extends CustomClipper<Path> {
  Clipper({
    required this.svgPath,
  });
  String svgPath;

  @override
  Path getClip(Size size) {
    var path = parseSvgPathData(svgPath);
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(0.42, 0.42);
    return path.transform(matrix4.storage).shift(const Offset(0, 0));
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
