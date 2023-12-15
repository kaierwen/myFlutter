import 'dart:io';

import 'package:bitcoin_ticker/services/coin_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  List<CoinData> allCoins = [];
  CoinApi api = CoinApi();
  int currentReq = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < cryptoList.length; i++) {
      String crypto = cryptoList[i];
      allCoins.add(CoinData(index: i, crypto: crypto));
    }
    _getCoinData();
  }

  _getCoinData() async {
    print('currentReq = $currentReq');
    if (currentReq < allCoins.length) {
      CoinData coinData = allCoins[currentReq];
      double rateResult =
          await api.getRate(base: coinData.crypto, quote: selectedCurrency);
      setState(() {
        coinData.rate = rateResult.toStringAsFixed(1);
      });
      currentReq++;
      _getCoinData();
    }
  }

  // String? selectCrypto1 = cryptoList[0];
  // String? selectCrypto2 = cryptoList[1];
  // String? selectCrypto3 = cryptoList[2];

  // String firstRate = '?';
  // CoinData coin1 = CoinData(crypto: cryptoList[0], currency: currenciesList[0]);
  // CoinData coin2 = CoinData(crypto: cryptoList[1], currency: currenciesList[0]);
  // CoinData coin3 = CoinData(crypto: cryptoList[2], currency: currenciesList[0]);

  // _getCoinData1(CoinData coinData) async {
  //   double rateResult =
  //       await api.getRate(base: coinData.crypto, quote: coinData.currency);
  //   setState(() {
  //     coin1.rate = rateResult.toStringAsFixed(1);
  //   });
  //   _getCoinData2();
  // }

  // _getCoinData2() async {
  //   double rateResult =
  //       await api.getRate(base: coin2.crypto, quote: coin2.currency);
  //   setState(() {
  //     coin2.rate = rateResult.toStringAsFixed(1);
  //   });
  //   _getCoinData3();
  // }

  // _getCoinData3() async {
  //   double rateResult =
  //       await api.getRate(base: coin3.crypto, quote: coin3.currency);
  //   setState(() {
  //     coin3.rate = rateResult.toStringAsFixed(1);
  //   });
  // }
  void _pickCurrency() {
    currentReq = 0;
    for (var coin in allCoins) {
      coin.rate = '?';
    }
    _getCoinData();
  }

  Widget androidDropDown() {
    List<DropdownMenuEntry<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      DropdownMenuEntry<String> newItem = DropdownMenuEntry<String>(
        label: currency,
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownMenu<String>(
      initialSelection: selectedCurrency,
      label: const Text('Currency'),
      onSelected: (value) {
        setState(() {
          selectedCurrency = value!;
          _pickCurrency();
        });
      },
      dropdownMenuEntries: dropdownItems,
    );
  }

  Widget iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 40.0,
      onSelectedItemChanged: (index) {
        selectedCurrency = currenciesList[index];
        _pickCurrency();
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RateButton(
              selectCrypto: allCoins[0].crypto,
              rate: allCoins[0].rate,
              selectedCurrency: selectedCurrency),
          RateButton(
              selectCrypto: allCoins[1].crypto,
              rate: allCoins[1].rate,
              selectedCurrency: selectedCurrency),
          RateButton(
              selectCrypto: allCoins[2].crypto,
              rate: allCoins[2].rate,
              selectedCurrency: selectedCurrency),
          Expanded(child: SizedBox()),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}

class RateButton extends StatelessWidget {
  const RateButton({
    super.key,
    required this.selectCrypto,
    required this.rate,
    required this.selectedCurrency,
  });

  final String? selectCrypto;
  final String rate;
  final String? selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $selectCrypto = $rate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
