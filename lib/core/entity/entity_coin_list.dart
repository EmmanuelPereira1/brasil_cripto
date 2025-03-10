class EntityCoinList {
  String id;
  String symbol;
  String name;
  String image;
  dynamic currentPrice;
  dynamic marketCap;
  dynamic marketCapRank;
  dynamic fullyDilutedValuation;
  dynamic totalVolume;
  dynamic high24H;
  dynamic low24H;
  dynamic priceChange24H;
  dynamic priceChangePercentage24H;
  dynamic marketCapChange24H;
  dynamic marketCapChangePercentage24H;
  dynamic circulatingSupply;
  dynamic totalSupply;
  dynamic maxSupply;
  dynamic ath;
  dynamic athChangePercentage;
  dynamic athDate;
  dynamic atl;
  dynamic atlChangePercentage;
  dynamic atlDate;
  dynamic roi;
  dynamic lastUpdated;

  EntityCoinList({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
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
    required this.lastUpdated,
  });

  factory EntityCoinList.fromJson(Map<String, dynamic> json) => EntityCoinList(
    id: json["id"] ?? '',
    symbol: json["symbol"] ?? '',
    name: json["name"] ?? '',
    image: json["image"] ?? '',
    currentPrice: json["current_price"] ?? '',
    marketCap: json["market_cap"] ?? '',
    marketCapRank: json["market_cap_rank"] ?? '',
    fullyDilutedValuation: json["fully_diluted_valuation"] ?? '',
    totalVolume: json["total_volume"] ?? '',
    high24H: json["high_24h"] ?? '',
    low24H: json["low_24h"] ?? '',
    priceChange24H: json["price_change_24h"]?.toDouble() ?? '',
    priceChangePercentage24H:
        json["price_change_percentage_24h"]?.toDouble() ?? '',
    marketCapChange24H: json["market_cap_change_24h"]?.toDouble() ?? '',
    marketCapChangePercentage24H:
        json["market_cap_change_percentage_24h"]?.toDouble() ?? '',
    circulatingSupply: json["circulating_supply"] ?? '',
    totalSupply: json["total_supply"] ?? '',
    maxSupply: json["max_supply"] ?? '',
    ath: json["ath"] ?? '',
    athChangePercentage: json["ath_change_percentage"]?.toDouble() ?? '',
    athDate: DateTime.parse(json["ath_date"] ?? ''),
    atl: json["atl"]?.toDouble() ?? '',
    atlChangePercentage: json["atl_change_percentage"]?.toDouble() ?? '',
    atlDate: DateTime.parse(json["atl_date"] ?? ''),
    roi: json["roi"] ?? '',
    lastUpdated: DateTime.parse(json["last_updated"] ?? ''),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "symbol": symbol,
    "name": name,
    "image": image,
    "current_price": currentPrice,
    "market_cap": marketCap,
    "market_cap_rank": marketCapRank,
    "fully_diluted_valuation": fullyDilutedValuation,
    "total_volume": totalVolume,
    "high_24h": high24H,
    "low_24h": low24H,
    "price_change_24h": priceChange24H,
    "price_change_percentage_24h": priceChangePercentage24H,
    "market_cap_change_24h": marketCapChange24H,
    "market_cap_change_percentage_24h": marketCapChangePercentage24H,
    "circulating_supply": circulatingSupply,
    "total_supply": totalSupply,
    "max_supply": maxSupply,
    "ath": ath,
    "ath_change_percentage": athChangePercentage,
    "ath_date": athDate.toIso8601String(),
    "atl": atl,
    "atl_change_percentage": atlChangePercentage,
    "atl_date": atlDate.toIso8601String(),
    "roi": roi,
    "last_updated": lastUpdated.toIso8601String(),
  };

  // Sobrescrevendo o método toString para exibir dados de forma legível
  @override
  String toString() {
    return 'EntityCoinList(id: $id, symbol: $symbol, name: $name, currentPrice: $currentPrice)';
  }
}
