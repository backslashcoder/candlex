import '../enums.dart';

/// Immutable base definition for a seed stock. The simulator derives live
/// snapshots from these; base prices are illustrative, NOT current quotes.
class StockSeed {
  const StockSeed(
    this.symbol,
    this.name,
    this.sector,
    this.basePrice,
    this.marketCapCr, {
    this.exchange = Exchange.nse,
  });

  final String symbol;
  final String name;
  final String sector;
  final double basePrice;

  /// Market capitalization in ₹ crore.
  final double marketCapCr;
  final Exchange exchange;

  double get marketCapRupees => marketCapCr * 1e7;
}

/// Canonical sector list used across the terminal.
const List<String> kSectors = [
  'Banking',
  'IT',
  'Auto',
  'Pharma',
  'FMCG',
  'Metals',
  'Energy',
  'Realty',
  'Financial Services',
];

/// Deterministic catalog of F&O constituents. Sector membership is fixed and
/// consistent everywhere in the app.
const List<StockSeed> kStockSeeds = [
  // Banking
  StockSeed('HDFCBANK', 'HDFC Bank', 'Banking', 1685, 1280000),
  StockSeed('ICICIBANK', 'ICICI Bank', 'Banking', 1245, 875000),
  StockSeed('SBIN', 'State Bank of India', 'Banking', 835, 745000),
  StockSeed('AXISBANK', 'Axis Bank', 'Banking', 1120, 345000),
  StockSeed('KOTAKBANK', 'Kotak Mahindra Bank', 'Banking', 1795, 356000),
  StockSeed('INDUSINDBK', 'IndusInd Bank', 'Banking', 985, 76000),
  StockSeed('BANKBARODA', 'Bank of Baroda', 'Banking', 248, 128000),
  StockSeed('PNB', 'Punjab National Bank', 'Banking', 104, 119000),
  StockSeed('AUBANK', 'AU Small Finance Bank', 'Banking', 615, 45000),
  StockSeed('FEDERALBNK', 'Federal Bank', 'Banking', 208, 50000),

  // IT
  StockSeed('TCS', 'Tata Consultancy Services', 'IT', 3920, 1420000),
  StockSeed('INFY', 'Infosys', 'IT', 1865, 775000),
  StockSeed('HCLTECH', 'HCL Technologies', 'IT', 1795, 486000),
  StockSeed('WIPRO', 'Wipro', 'IT', 548, 286000),
  StockSeed('TECHM', 'Tech Mahindra', 'IT', 1630, 159000),
  StockSeed('LTIM', 'LTIMindtree', 'IT', 6240, 184000),
  StockSeed('PERSISTENT', 'Persistent Systems', 'IT', 5680, 87000),
  StockSeed('COFORGE', 'Coforge', 'IT', 8120, 54000),
  StockSeed('BHARTIARTL', 'Bharti Airtel', 'IT', 1585, 920000),

  // Auto
  StockSeed('TATAMOTORS', 'Tata Motors', 'Auto', 985, 362000),
  StockSeed('MARUTI', 'Maruti Suzuki', 'Auto', 12450, 391000),
  StockSeed('M&M', 'Mahindra & Mahindra', 'Auto', 2890, 359000),
  StockSeed('BAJAJ-AUTO', 'Bajaj Auto', 'Auto', 9120, 254000),
  StockSeed('EICHERMOT', 'Eicher Motors', 'Auto', 4780, 131000),
  StockSeed('HEROMOTOCO', 'Hero MotoCorp', 'Auto', 4650, 93000),
  StockSeed('TVSMOTOR', 'TVS Motor', 'Auto', 2420, 115000),
  StockSeed('ASHOKLEY', 'Ashok Leyland', 'Auto', 228, 67000),

  // Pharma
  StockSeed('SUNPHARMA', 'Sun Pharmaceutical', 'Pharma', 1720, 413000),
  StockSeed('DRREDDY', 'Dr. Reddy\'s Labs', 'Pharma', 1285, 214000),
  StockSeed('CIPLA', 'Cipla', 'Pharma', 1540, 124000),
  StockSeed('DIVISLAB', 'Divi\'s Laboratories', 'Pharma', 5920, 157000),
  StockSeed('AUROPHARMA', 'Aurobindo Pharma', 'Pharma', 1385, 81000),
  StockSeed('LUPIN', 'Lupin', 'Pharma', 2180, 99000),

  // FMCG
  StockSeed('ITC', 'ITC', 'FMCG', 458, 573000),
  StockSeed('HINDUNILVR', 'Hindustan Unilever', 'FMCG', 2640, 620000),
  StockSeed('NESTLEIND', 'Nestle India', 'FMCG', 2290, 221000),
  StockSeed('BRITANNIA', 'Britannia Industries', 'FMCG', 5240, 126000),
  StockSeed('TATACONSUM', 'Tata Consumer Products', 'FMCG', 1095, 108000),
  StockSeed('TITAN', 'Titan Company', 'FMCG', 3420, 303000),
  StockSeed('DABUR', 'Dabur India', 'FMCG', 538, 95000),

  // Metals
  StockSeed('TATASTEEL', 'Tata Steel', 'Metals', 158, 197000),
  StockSeed('JSWSTEEL', 'JSW Steel', 'Metals', 1010, 247000),
  StockSeed('HINDALCO', 'Hindalco Industries', 'Metals', 685, 154000),
  StockSeed('VEDL', 'Vedanta', 'Metals', 462, 180000),
  StockSeed('COALINDIA', 'Coal India', 'Metals', 418, 258000),
  StockSeed('NMDC', 'NMDC', 'Metals', 232, 68000),
  StockSeed('SAIL', 'Steel Authority of India', 'Metals', 128, 53000),

  // Energy
  StockSeed('RELIANCE', 'Reliance Industries', 'Energy', 2920, 1975000),
  StockSeed('ONGC', 'Oil & Natural Gas Corp', 'Energy', 268, 337000),
  StockSeed('NTPC', 'NTPC', 'Energy', 362, 351000),
  StockSeed('POWERGRID', 'Power Grid Corp', 'Energy', 318, 296000),
  StockSeed('BPCL', 'Bharat Petroleum', 'Energy', 312, 135000),
  StockSeed('GAIL', 'GAIL India', 'Energy', 198, 130000),
  StockSeed('LT', 'Larsen & Toubro', 'Energy', 3640, 500000),

  // Realty
  StockSeed('DLF', 'DLF', 'Realty', 815, 202000),
  StockSeed('GODREJPROP', 'Godrej Properties', 'Realty', 2810, 78000),
  StockSeed('OBEROIRLTY', 'Oberoi Realty', 'Realty', 1890, 68000),
  StockSeed('PRESTIGE', 'Prestige Estates', 'Realty', 1620, 65000),

  // Financial Services
  StockSeed('BAJFINANCE', 'Bajaj Finance', 'Financial Services', 7240, 448000),
  StockSeed('BAJAJFINSV', 'Bajaj Finserv', 'Financial Services', 1680, 268000),
  StockSeed('HDFCLIFE', 'HDFC Life Insurance', 'Financial Services', 648, 139000),
  StockSeed('SBILIFE', 'SBI Life Insurance', 'Financial Services', 1485, 149000),
  StockSeed('ICICIPRULI', 'ICICI Prudential Life', 'Financial Services', 648, 93000),
  StockSeed('CHOLAFIN', 'Cholamandalam Finance', 'Financial Services', 1320, 111000),
  StockSeed('SHRIRAMFIN', 'Shriram Finance', 'Financial Services', 3180, 119000),
];

/// Seed definition for a headline index.
class IndexSeed {
  const IndexSeed(this.symbol, this.name, this.base, {this.isVix = false});
  final String symbol;
  final String name;
  final double base;
  final bool isVix;
}

const List<IndexSeed> kIndexSeeds = [
  IndexSeed('NIFTY 50', 'Nifty 50', 24850),
  IndexSeed('BANK NIFTY', 'Nifty Bank', 52140),
  IndexSeed('FINNIFTY', 'Nifty Financial', 23480),
  IndexSeed('SENSEX', 'BSE Sensex', 81340),
  IndexSeed('INDIA VIX', 'India VIX', 13.8, isVix: true),
];
