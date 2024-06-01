extension FormatNumberToString on num {
  String toNumberWithLeadingZeros(int numberOfLeadingZeros){
    String number = toString();
    int numberLength = number.length;
    String leadingZeros = '';
    for (int i = 0; i < numberOfLeadingZeros - numberLength; i++){
      leadingZeros += "0";
    }
    return leadingZeros + number;
  }

  String getOrdinal(int number){
    String numberAsString = number.toString();
    if(numberAsString.endsWith('11')){
      return 'th';
    }
    if(numberAsString.endsWith('1')){
      return 'st';
    }
    if(numberAsString.endsWith('2')){
      return 'nd';
    }
    if(numberAsString.endsWith('3')){
      return 'rd';
    }

    return 'th';
  }
}