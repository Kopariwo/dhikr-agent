# Polymarket Trading Knowledge Base
## Extracted from curated Twitter/X bookmarks — actionable strategies only

---

## CORE PRINCIPLE: Win Rate Is A Trap
- Buying YES at 85 cents means risking 85 cents to make 18 cents
- One loss wipes multiple wins
- High win rate traders are often just breaking even or worse
- Focus on: Realized PnL, consistency over months, category specialization, drawdown behavior under pressure

---

## STRATEGY 1: Weather Market Arbitrage
**Source: Multiple top traders, $80K+ profits documented**
- Weather forecast models (NOAA, etc.) update constantly with ~94% accuracy
- Prediction markets update SLOWLY
- The bot compares forecast probability with market probability
- Buy when they dont match — this is arbitrage between reality and the market
- Best approach: Enter EARLY at 0.08-0.30 on underpriced ranges
- Sell when price moves to 0.60-0.98 — dont wait for expiry
- Focus cities: NYC and Seattle as core markets
- Win rate only needs to be ~66% because a 0.10 entry that hits pays 10x
- Example: $330 deposits turned into $45,152 PnL in 6 months

---

## STRATEGY 2: Spread Trading / Short-Term Crypto Markets
**Source: Top BTC traders on Polymarket**
- Trade 5-minute and 15-minute BTC/SOL/ETH price markets
- The bot sees the spread between spot BTC price and Polymarket BTC prediction
- Buys fast, sells fast — speed is the edge
- Technical indicators used by profitable traders:
  - MACD: catches momentum, sees when volume picks up, gets in before the crowd
  - RSI + VWAP: trades reversals at key levels
  - CVD divergence: detects hidden buying/selling pressure
- Key: This requires fast execution and API trading access

---

## STRATEGY 3: Copy Trading Top Wallets
**Source: Multiple traders scaling $100s to $30K+**
- Find top performing wallets on Polymarket leaderboards
- Filter for: Sharpe ratio > 2.0, win rate > 65%, minimum 1000+ trades
- Only 0.51% of traders survive these filters — these are the apex wallets
- Monitor their on-chain activity in real time
- When apex wallets move, follow with smaller positions
- Dont blindly copy — understand WHY they entered
- Tools: Nansen, Polymarket Data API, on-chain monitoring

---

## STRATEGY 4: Timezone Arbitrage
**Source: OpenClaw trader, +$43K documented**
- Markets resolve based on real-world events in specific timezones
- When US is asleep, events happen in Asia/Europe/Middle East
- News breaks in one timezone but market hasnt reacted yet
- Setup: Give bot access to global news feeds across timezones
  - Japanese government RSS
  - European parliament calendars
  - Australian financial wires
  - Middle East news sources
- Bot finds markets resolving in next 90 minutes while most traders are asleep
- Edge: Being first to react to breaking news across time zones

---

## STRATEGY 5: Parlay / Multi-Outcome Stacking
**Source: Trader who turned $9,900 into $53,000**
- On Polymarket you bet on one outcome at a time
- Some platforms let you combine multiple outcomes into one bet (parlay)
- Take two high-confidence trades and stack them for multiplied returns
- Example: 5.43x from a single entry by combining obvious outcomes
- Risk: If ONE leg fails, the whole parlay fails
- Only use with very high confidence picks

---

## RISK MANAGEMENT: The Kelly Criterion
**Source: Trader who recovered from $150 to $940 in 5 weeks**
- The #1 mistake: risking 30-50% of bankroll per trade
- Kelly Criterion calculates optimal bet size based on edge and odds
- Formula: Kelly % = (bp - q) / b
  - b = odds received (decimal odds minus 1)
  - p = probability of winning
  - q = probability of losing (1 - p)
- For beginners: use QUARTER Kelly (divide Kelly result by 4)
- This means betting 4-8% of bankroll per position, not 30-40%
- Result: Boring but no blowups
- Quote: "Turns out boring is what surviving looks like"

---

## WHAT TOP TRADERS HAVE IN COMMON
- They use simple math formulas, not gut feelings
- They focus on 5-8% spreads consistently
- They specialize in categories (weather, sports, politics — not everything)
- They track realized PnL, not paper gains
- They manage drawdowns carefully
- They automate execution to remove emotions
- Prediction markets stopped being gambling — its math and formulas

---

## BOT ANALYSIS RULES (from top 1000 trader analysis)
1. Dont predict outcomes — analyze behavioral fingerprints of profitable traders
2. Look for arbitrage between data sources and market prices
3. Speed matters — markets that are slow to update after news are opportunities
4. Specialize — pick 2-3 market categories and go deep
5. Size positions using Kelly Criterion or quarter-Kelly
6. Track every trade with full PnL accounting
7. Never risk more than you can afford to lose
8. The edge is in the data, not in guessing

---

## RED FLAGS TO AVOID
- Risking more than 10% of bankroll on any single trade
- Chasing high win rates instead of positive expected value
- Copying random wallets without understanding their strategy
- Trading every market instead of specializing
- Entering at 95-99 cent prices for tiny premiums (bad risk/reward)
- Ignoring fees and slippage in edge calculations
- Emotional trading — let the math decide

---

## MARKET CATEGORIES RANKED BY BOT PROFITABILITY
1. **Weather markets** — Most bot-friendly, data is public and accurate, markets update slow
2. **Short-term crypto** (5min/15min) — High frequency, needs fast execution
3. **Sports** — Sportsbook odds provide comparison data, well-defined outcomes
4. **Politics/Geopolitics** — Requires news analysis, harder to automate but big edges exist
5. **Economics** (Fed decisions, GDP, etc.) — Data-driven, good for research bots

---

*This knowledge base should be used alongside live market data. Always verify current conditions before acting on any strategy. Past performance does not guarantee future results.*
