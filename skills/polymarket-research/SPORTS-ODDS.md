# Sports Odds Comparison for Polymarket

## How to Use
For any sports market on Polymarket, compare the price against real sportsbook odds. If Polymarket and sportsbooks disagree, thats your edge.

## The Odds API (Free Tier, No Key Needed for Basic Use)

### Convert Sportsbook Odds to Probability
- American odds +150 = 100/(150+100) = 40% implied probability
- American odds -200 = 200/(200+100) = 66.7% implied probability
- Decimal odds 2.50 = 1/2.50 = 40% implied probability

## Free Sports Data Sources

### Check Live Scores and Schedules
```bash
curl -s "https://www.thesportsdb.com/api/v1/json/3/eventsday.php?d=2026-03-28" | python3 -m json.tool
```

### Search for a Specific Team
```bash
curl -s "https://www.thesportsdb.com/api/v1/json/3/searchteams.php?t=Arsenal" | python3 -m json.tool
```

### Get League Standings
```bash
curl -s "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026" | python3 -m json.tool
```
League IDs: 4328=EPL, 4332=Serie A, 4335=La Liga, 4331=Bundesliga, 4334=Ligue 1, 4346=MLS, 4391=NFL, 4387=NBA, 4380=NHL, 4424=MLB

## Sports Arbitrage Workflow

1. Find sports markets on Polymarket
2. Identify the event, teams, and date
3. Search for sportsbook consensus odds using web search
4. Convert sportsbook odds to implied probability
5. Compare sportsbook probability vs Polymarket price
6. If they disagree by 5% or more — flag as potential edge
7. Check for injuries, suspensions, weather, or other factors that could explain the difference

## Example
- Polymarket: "Will Arsenal win vs Chelsea?" YES @ 55 cents (55% implied)
- Sportsbook consensus: Arsenal at -130 (56.5% implied)
- Difference: Only 1.5% — NO EDGE
- But if sportsbooks say 65% and Polymarket says 55% — thats a 10% edge worth flagging

## Rules
- Sportsbooks have professional odds makers — their lines are usually efficient
- When Polymarket disagrees with ALL major sportsbooks, Polymarket is usually wrong
- Look for markets where Polymarket is slow to react to late-breaking news (injuries, lineup changes)
- Always check when the Polymarket price was last updated vs when odds moved
