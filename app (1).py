import streamlit as st
import pandas as pd
import plotly.express as px
import requests
from datetime import datetime

st.set_page_config(page_title="🎮 Pro Gaming Dashboard", layout="wide")

# -----------------------------
# 🎮 Rank Icons (UI 강화)
# -----------------------------
rank_icons = {
    "Iron": "⚙️",
    "Bronze": "🥉",
    "Silver": "🥈",
    "Gold": "🥇",
    "Platinum": "💎",
    "Diamond": "🔷",
    "Master": "👑",
    "Challenger": "🔥"
}

rank_order = {k:i+1 for i,k in enumerate(rank_icons.keys())}

# -----------------------------
# 📡 API 구조 (확장용)
# -----------------------------
def fetch_riot_data(player_name):
    # 실제 사용 시 API KEY 넣기
    # url = f"https://api.riotgames.com/..."
    # headers = {"X-Riot-Token": "YOUR_API_KEY"}
    # response = requests.get(url, headers=headers)
    # return response.json()
    return None

# -----------------------------
# 🎨 Sample Data
# -----------------------------
data = pd.DataFrame({
    "Game": ["Valorant","LoL","Valorant","Overwatch","LoL","Valorant"],
    "Player": ["Alex","Jamie","Alex","Chris","Jamie","Chris"],
    "Rank": ["Gold","Silver","Platinum","Diamond","Gold","Gold"],
    "Wins": [10,6,12,15,8,7],
    "Losses": [5,7,6,4,6,8],
    "Kills": [150,120,200,180,140,130],
    "Deaths": [80,100,90,70,110,95],
    "Assists": [60,40,80,50,55,45],
    "Accuracy": [45,38,50,55,42,40],
    "Play Time": [6,5,7,8,5,4],
    "Date": pd.to_datetime([
        "2026-04-01","2026-04-02","2026-04-08",
        "2026-04-03","2026-04-10","2026-04-12"
    ])
})

# -----------------------------
# ⚙️ Calculations
# -----------------------------
data["Total Matches"] = data["Wins"] + data["Losses"]
data["Win Rate"] = data["Wins"] / data["Total Matches"]
data["KDA"] = (data["Kills"] + data["Assists"]) / data["Deaths"]
data["Rank Score"] = data["Rank"].map(rank_order)

# -----------------------------
# 🎛 Sidebar Input
# -----------------------------
st.sidebar.header("➕ Add Session")

game = st.sidebar.text_input("Game")
player = st.sidebar.text_input("Player")
rank = st.sidebar.selectbox("Rank", list(rank_icons.keys()))
wins = st.sidebar.number_input("Wins", 0)
losses = st.sidebar.number_input("Losses", 0)
kills = st.sidebar.number_input("Kills", 0)
deaths = st.sidebar.number_input("Deaths", 1)
assists = st.sidebar.number_input("Assists", 0)
accuracy = st.sidebar.slider("Accuracy (%)", 0, 100)
playtime = st.sidebar.number_input("Play Time (h)", 0.0)
date = st.sidebar.date_input("Date")

if st.sidebar.button("Add"):
    new = pd.DataFrame({
        "Game":[game],
        "Player":[player],
        "Rank":[rank],
        "Wins":[wins],
        "Losses":[losses],
        "Kills":[kills],
        "Deaths":[deaths],
        "Assists":[assists],
        "Accuracy":[accuracy],
        "Play Time":[playtime],
        "Date":[pd.to_datetime(date)]
    })
    new["Total Matches"] = new["Wins"] + new["Losses"]
    new["Win Rate"] = new["Wins"] / new["Total Matches"]
    new["KDA"] = (new["Kills"] + new["Assists"]) / new["Deaths"]
    new["Rank Score"] = new["Rank"].map(rank_order)
    data = pd.concat([data, new], ignore_index=True)

# -----------------------------
# 🔍 Filter
# -----------------------------
st.title("🎮 Pro Gaming Dashboard")

search = st.text_input("🔍 Search Player/Game")
filtered = data[
    data["Player"].str.contains(search, case=False) |
    data["Game"].str.contains(search, case=False)
] if search else data

# -----------------------------
# 👤 Player Profile Card
# -----------------------------
latest = filtered.sort_values("Date").iloc[-1]

st.markdown("### 👤 Player Profile")

col1, col2, col3, col4 = st.columns(4)

col1.metric("🎯 Player", latest["Player"])
col2.metric("🏆 Rank", f"{rank_icons[latest['Rank']]} {latest['Rank']}")
col3.metric("🔥 Win Rate", f"{latest['Win Rate']:.2%}")
col4.metric("⚔️ KDA", f"{latest['KDA']:.2f}")

# -----------------------------
# 📊 Metrics
# -----------------------------
colA, colB, colC = st.columns(3)

colA.metric("⏱ Total Play Time", f"{filtered['Play Time'].sum():.1f}h")
colB.metric("📈 Avg Accuracy", f"{filtered['Accuracy'].mean():.1f}%")
colC.metric("🎮 Total Matches", int(filtered["Total Matches"].sum()))

# -----------------------------
# 📋 Table (Win/Loss Color)
# -----------------------------
def highlight(row):
    return ["color: green" if row["Wins"] > row["Losses"] else "color: red"]*len(row)

st.subheader("📋 Match History")
st.dataframe(filtered.style.apply(highlight, axis=1), use_container_width=True)

# -----------------------------
# 📈 Rank Progression
# -----------------------------
st.subheader("📈 Rank Progression")

fig_rank = px.line(
    filtered.sort_values("Date"),
    x="Date",
    y="Rank Score",
    color="Player",
    markers=True
)

fig_rank.update_yaxes(
    tickvals=list(rank_order.values()),
    ticktext=list(rank_order.keys())
)

st.plotly_chart(fig_rank, use_container_width=True)

# -----------------------------
# ⏱ Playtime Trend
# -----------------------------
st.subheader("⏱ Play Time Trend")

fig_time = px.line(
    filtered.sort_values("Date"),
    x="Date",
    y="Play Time",
    color="Player",
    markers=True
)

st.plotly_chart(fig_time, use_container_width=True)

# -----------------------------
# 🎯 Win/Loss Tracker
# -----------------------------
st.subheader("🎯 Win/Loss Tracker")

wl = filtered.groupby("Player")[["Wins","Losses"]].sum().reset_index()

fig_bar = px.bar(
    wl,
    x="Player",
    y=["Wins","Losses"],
    barmode="group"
)

st.plotly_chart(fig_bar, use_container_width=True)

# -----------------------------
# ✨ Footer
# -----------------------------
st.markdown("---")
st.markdown("🔥 *Grind. Improve. Dominate.* 🎮")
