#!/usr/bin/env python3
"""
Polymarket Auto-Trading Script
Executes trades via Polymarket CLOB API
"""

import json
import os
import sys
import requests
from datetime import datetime

# === CONFIGURATION ===
POLYMARKET_HOST = "https://clob.polymarket.com"
GAMMA_API = "https://gamma-api.polymarket.com"
CHAIN_ID = 137  # Polygon

# Safety limits
MAX_TRADE_SIZE = 5.00      # Max dollars per trade
MAX_DAILY_TRADES = 5       # Max trades per day
MAX_DAILY_LOSS = 10.00     # Stop trading if daily loss hits this
MIN_EDGE = 5.0             # Minimum edge % to trade
MIN_CONFIDENCE = 70        # Minimum confidence score to trade
BANKROLL = 10.00           # Starting bankroll - update this

# Trade log file
TRADE_LOG = "/tmp/polymarket_trades.json"

def load_trade_log():
    try:
        with open(TRADE_LOG, 'r') as f:
            return json.load(f)
    except:
        return {"trades": [], "daily_pnl": 0, "daily_trades": 0, "last_reset": str(datetime.now().date())}

def save_trade_log(log):
    with open(TRADE_LOG, 'w') as f:
        json.dump(log, f, indent=2)

def reset_daily_if_needed(log):
    today = str(datetime.now().date())
    if log.get("last_reset") != today:
        log["daily_pnl"] = 0
        log["daily_trades"] = 0
        log["last_reset"] = today
    return log

def check_safety_limits(log, trade_amount):
    """Returns (allowed, reason)"""
    if log["daily_trades"] >= MAX_DAILY_TRADES:
        return False, f"Daily trade limit reached ({MAX_DAILY_TRADES})"
    if log["daily_pnl"] <= -MAX_DAILY_LOSS:
        return False, f"Daily loss limit reached (${MAX_DAILY_LOSS})"
    if trade_amount > MAX_TRADE_SIZE:
        return False, f"Trade size ${trade_amount} exceeds max ${MAX_TRADE_SIZE}"
    if trade_amount > BANKROLL * 0.10:
        return False, f"Trade size exceeds 10% of bankroll"
    return True, "OK"

def kelly_criterion(market_price, estimated_prob, quarter=True):
    """Calculate position size using Kelly Criterion"""
    if market_price <= 0 or market_price >= 1:
        return 0
    b = (1 / market_price) - 1
    p = estimated_prob
    q = 1 - p
    kelly = (b * p - q) / b if b > 0 else 0
    if kelly <= 0:
        return 0
    if quarter:
        kelly = kelly / 4
    position = min(kelly * BANKROLL, MAX_TRADE_SIZE, BANKROLL * 0.10)
    return round(position, 2)

def get_market_price(token_id):
    """Get current market price from CLOB"""
    try:
        resp = requests.get(f"{POLYMARKET_HOST}/book?token_id={token_id}", timeout=10)
        data = resp.json()
        if data.get("asks") and len(data["asks"]) > 0:
            return float(data["asks"][0]["price"])
        return None
    except:
        return None

def search_markets(keyword="", limit=10):
    """Search active markets"""
    try:
        params = {"active": "true", "closed": "false", "limit": limit}
        resp = requests.get(f"{GAMMA_API}/markets", params=params, timeout=10)
        return resp.json()
    except:
        return []

def format_trade_alert(market_question, side, price, fair_value, edge, confidence, kelly_size):
    """Format trade for Telegram"""
    return f"""
🤖 AUTO-TRADE EXECUTED
━━━━━━━━━━━━━━━━
Market: {market_question}
Side: {side}
Entry Price: {price} cents
Fair Value: {fair_value} cents
Edge: +{edge}%
Confidence: {confidence}%
Position Size: ${kelly_size}
━━━━━━━━━━━━━━━━
Kelly: Quarter-Kelly applied
Safety: All limits checked
"""

def format_status_report(log):
    """Format daily status"""
    return f"""
📊 TRADING STATUS
━━━━━━━━━━━━━━━━
Trades Today: {log['daily_trades']}/{MAX_DAILY_TRADES}
Daily PnL: ${log['daily_pnl']:.2f}
Bankroll: ${BANKROLL}
Max Trade Size: ${MAX_TRADE_SIZE}
Daily Loss Limit: ${MAX_DAILY_LOSS}
━━━━━━━━━━━━━━━━
Active Limits: All safety checks ON
"""

# === MAIN EXECUTION ===
if __name__ == "__main__":
    action = sys.argv[1] if len(sys.argv) > 1 else "status"
    log = load_trade_log()
    log = reset_daily_if_needed(log)
    
    if action == "status":
        print(format_status_report(log))
    elif action == "kelly":
        # Usage: python3 autotrade.py kelly 0.65 0.75
        price = float(sys.argv[2])
        prob = float(sys.argv[3])
        size = kelly_criterion(price, prob)
        print(f"Quarter Kelly position size: ${size}")
    elif action == "check":
        # Check if trade is allowed
        amount = float(sys.argv[2])
        allowed, reason = check_safety_limits(log, amount)
        print(f"Trade allowed: {allowed} - {reason}")
    
    save_trade_log(log)
