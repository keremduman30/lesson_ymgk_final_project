
class ApplicationConstant {
  static ApplicationConstant? _instace;
  static ApplicationConstant get instance {
    _instace ??= ApplicationConstant._init();
    return _instace!;
  }
  final infoText="Bir çiftçinin beş ineği var: Sultan, Benekli, Tosun, Şaşkın ve Garip. Çiftçi, her bir ineğin günde kaç ünite süt verdiğini göstermek için bir tablo çizer. Ne var ki ineklerin ismini tabloya yazmayı unutur. Tek hatırladığı Sultan'ın Tosun'dan bir ünite fazla, Garip'in ise Benekli ile aynı miktarda süt verdiğidir.";
  final questionText="Buna göre her bir inek kaç ünite süt vermiştir?";
  final bardataYInfo="Üretilen Süt Miktarı";

  ApplicationConstant._init();

}
