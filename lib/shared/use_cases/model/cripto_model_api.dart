class CriptoModelApi {
  String id;
  String symbol;
  String name;
  String image;
  int currentPrice;
  int marketCap;
  int marketCapRank;
  int fullyDilutedValuation;
  int totalVolume;
  int high24h;
  int low24h;
  double priceChange24h;
  double priceChangePercentage24h;
  double marketCapChange24h;
  double marketCapChangePercentage24h;
  int circulatingSupply;
  int totalSupply;
  int maxSupply;
  int ath;
  double athChangePercentage;
  String athDate;
  double atl;
  double atlChangePercentage;
  String atlDate;
  Null roi;
  String lastUpdated;

  CriptoModelApi(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.currentPrice,
      required this.marketCap,
      required this.marketCapRank,
      required this.fullyDilutedValuation,
      required this.totalVolume,
      required this.high24h,
      required this.low24h,
      required this.priceChange24h,
      required this.priceChangePercentage24h,
      required this.marketCapChange24h,
      required this.marketCapChangePercentage24h,
      required this.circulatingSupply,
      required this.totalSupply,
      required this.maxSupply,
      required this.ath,
      required this.athChangePercentage,
      required this.athDate,
      required this.atl,
      required this.atlChangePercentage,
      required this.atlDate,
      required this.roi,
      required this.lastUpdated});

  factory CriptoModelApi.fromMap(Map<String, dynamic> map) {
    return CriptoModelApi(
      id: map['id'],
      symbol: map['symbol'],
      name: map['name'],
      image: map['image'],
      currentPrice: map['current_price'],
      marketCap: map['market_cap'],
      marketCapRank: map['market_cap_rank'],
      fullyDilutedValuation: map['fully_diluted_valuation'],
      totalVolume: map['total_volume'],
      high24h: map['high_24h'],
      low24h: map['low_24h'],
      priceChange24h: map['price_change_24h'],
      priceChangePercentage24h: map['price_change_percentage_24h'],
      marketCapChange24h: map['market_cap_change_24h'],
      marketCapChangePercentage24h: map['market_cap_change_percentage_24h'],
      circulatingSupply: map['circulating_supply'],
      totalSupply: map['total_supply'],
      maxSupply: map['max_supply'],
      ath: map['ath'],
      athChangePercentage: map['ath_change_percentage'],
      athDate: map['ath_date'],
      atl: map['atl'],
      atlChangePercentage: map['atl_change_percentage'],
      atlDate: map['atl_date'],
      roi: map['roi'],
      lastUpdated: map['last_updated'],
    );
  }
}
