# Weather Data Sources for Polymarket Arbitrage

## How to Use
When scanning weather markets on Polymarket, ALWAYS fetch real forecast data first and compare it to the market price. If they dont match, thats your edge.

## Open-Meteo API (Free, No API Key Needed)

### Get Temperature Forecast for Any City
```bash
curl -s "https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&daily=temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit&timezone=America/New_York&forecast_days=7" | python3 -m json.tool
```
Above example is for New York City.

### Get Seattle Forecast
```bash
curl -s "https://api.open-meteo.com/v1/forecast?latitude=47.61&longitude=-122.33&daily=temperature_2m_max,temperature_2m_min&temperature_unit=fahrenheit&timezone=America/Los_Angeles&forecast_days=7" | python3 -m json.tool
```

### Common City Coordinates
- New York City: latitude=40.71, longitude=-74.01
- Seattle: latitude=47.61, longitude=-122.33
- Los Angeles: latitude=34.05, longitude=-118.24
- Chicago: latitude=41.88, longitude=-87.63
- Miami: latitude=25.76, longitude=-80.19
- London: latitude=51.51, longitude=-0.13
- Tokyo: latitude=35.68, longitude=139.69

### Get Precipitation Forecast
```bash
curl -s "https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&daily=precipitation_sum,precipitation_probability_max&timezone=America/New_York&forecast_days=7" | python3 -m json.tool
```

### Get Hourly Detail (for same-day markets)
```bash
curl -s "https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&hourly=temperature_2m,precipitation_probability&temperature_unit=fahrenheit&timezone=America/New_York&forecast_days=2" | python3 -m json.tool
```

## Weather Arbitrage Workflow

1. Find weather markets on Polymarket (temperature, rain, snow markets)
2. Identify the city and date the market is asking about
3. Fetch the real forecast using Open-Meteo API above
4. Compare forecast probability vs market price
5. If forecast says 90% chance of rain but market prices YES rain at 60 cents — thats a 30% edge
6. Apply Kelly Criterion from POLYMARKET-KNOWLEDGE.md for position sizing
7. Report the edge with data sources cited

## Key Rules
- Weather models are ~94% accurate for next-day forecasts
- Accuracy drops for forecasts beyond 3 days
- Always check multiple forecast runs if possible
- Markets often lag behind forecast updates by hours — thats the edge
- Focus on NYC and Seattle — highest volume weather markets on Polymarket
