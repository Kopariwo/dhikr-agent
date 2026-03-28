# Top Wallet Tracking for Polymarket

## How to Use
When scanning markets, check what top traders are doing. If apex wallets are making big moves on a market, that is a strong signal.

## Polymarket Leaderboard API (Free, No Auth)

### Get Top Traders
```bash
curl -s "https://data-api.polymarket.com/leaderboard?window=all&limit=20" | python3 -m json.tool
```

### Get Top Traders This Week
```bash
curl -s "https://data-api.polymarket.com/leaderboard?window=week&limit=20" | python3 -m json.tool
```

### Get Top Traders Today
```bash
curl -s "https://data-api.polymarket.com/leaderboard?window=day&limit=20" | python3 -m json.tool
```

### Get a Specific Trader's Positions
```bash
curl -s "https://data-api.polymarket.com/positions?user=WALLET_ADDRESS" | python3 -m json.tool
```

### Get a Trader's Recent Activity
```bash
curl -s "https://data-api.polymarket.com/activity?user=WALLET_ADDRESS&limit=20" | python3 -m json.tool
```

## Apex Wallet Filters
Only follow wallets that pass ALL of these:
- Sharpe ratio above 2.0
- Win rate above 65%
- Minimum 1000 trades
- Consistent profits over months not just lucky streaks
- Only 0.51% of traders pass these filters

## Workflow
1. Pull the weekly leaderboard
2. Filter for apex wallets using criteria above
3. Check their current open positions
4. If multiple apex wallets are in the same market on the same side — strong signal
5. Cross-reference with your own analysis from the scan
6. Report to user: "3 of the top 20 wallets are currently long NO on [market] — this aligns with my analysis"

## Rules
- Never blindly follow — always understand WHY they entered
- Top wallets can be wrong too — use as confirmation not as sole signal
- Flag when apex wallets disagree with your analysis — thats worth noting
