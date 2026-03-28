# Auto-Trading Skill

## When to Use
When the user says "auto-trade", "start trading", "execute trade", or "full auto mode", use this skill alongside the main Polymarket research skill.

## Safety System
Before EVERY trade, run these checks:
```bash
python3 /root/.openclaw/skills/polymarket-research/autotrade.py check AMOUNT
```
Replace AMOUNT with the dollar amount. If it returns "Trade allowed: False" — DO NOT TRADE. Tell the user why.

## Get Trading Status
```bash
python3 /root/.openclaw/skills/polymarket-research/autotrade.py status
```

## Calculate Position Size
```bash
python3 /root/.openclaw/skills/polymarket-research/autotrade.py kelly MARKET_PRICE YOUR_ESTIMATED_PROBABILITY
```
Example: Market at 0.65, you estimate 0.75 probability:
```bash
python3 /root/.openclaw/skills/polymarket-research/autotrade.py kelly 0.65 0.75
```

## Auto-Trading Workflow

### Step 1: Scan
Run a normal /scan using the Polymarket research skill. Apply all knowledge from POLYMARKET-KNOWLEDGE.md.

### Step 2: Filter
Only consider trades where:
- Edge is 5% or higher
- Confidence is 70% or higher
- Market has at least $50K in liquidity
- Market is NOT expiring in less than 1 hour

### Step 3: Size the Position
Use the Kelly calculator. Never exceed:
- $5 per trade
- 10% of bankroll per trade
- 5 trades per day
- $10 daily loss limit

### Step 4: Execute
When a trade passes all filters and safety checks, tell the user:
"I found a trade that passes all safety checks. Here are the details:"
Then show the full alert with Kelly sizing.

If user has enabled FULL AUTO MODE, execute immediately and report after.
If user has NOT enabled full auto, ask for confirmation first.

### Step 5: Monitor
After entering a trade, check the market price every time the user interacts.
- If position is up 50% or more: recommend taking profit
- If position is down 30% or more: recommend cutting loss
- If market is about to expire in 1 hour: recommend closing

## Full Auto Mode
User must explicitly say "enable full auto mode" to activate.
When active:
- Bot scans, finds, and executes trades without asking
- Still follows ALL safety limits
- Sends Telegram alert AFTER each trade
- Can be disabled with "disable full auto mode"

## Emergency Stop
If user says "stop", "pause", "emergency stop", or "halt":
- Immediately stop all trading
- Report all open positions
- Do not execute any new trades until user says "resume"

## Daily Report
At the end of each day (or when user asks), provide:
- Total trades made
- Win/loss record
- Total PnL
- Best and worst trade
- Remaining bankroll
- Recommendations for tomorrow
