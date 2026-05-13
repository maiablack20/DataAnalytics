# Maia Black
# 2026-05-13 

# Weekly Sales Statistics Analyzer Exercise

import statistics

analyst = input("Enter your name: ")
print("Name of Analyst: ", analyst)

region = input("Enter the name of your region: ")
print("Enter the region: ", region)

sales = []

for daily_sales_figure in range(7):
    daily_input = input("Enter your daily sales figure: ")
    sales.append(float(daily_input))

def analyze_sales(analyst, region, sales): 
    mean = statistics.mean(sales)
    median = statistics.median(sales)
    try:
        mode = statistics.mode(sales)
    except statistics.StatisticsError:
        mode = "No unique mode"
    stdev = statistics.stdev(sales)
    total_revenue = sum(sales)
    highest_sales = max(sales)
    lowest_sales = min(sales)
    return mean, median, mode, stdev, total_revenue, highest_sales, lowest_sales

mean, median, mode, stdev, total_revenue, highest_sales, lowest_sales = analyze_sales(analyst, region, sales)
print(f"""======= Weekly Sales Statistics Report ======= 
        Analyst: {analyst}
        Region: {region}
        Data: {sales}
        -----------------------------------------------
        Mean(avg): ${mean:.2f}
        Median: ${median:.2f}
        Mode: ${mode:.2f}
        STDEV: ${stdev:.2f}
        Total Revenue: ${total_revenue:.2f}
        Highest Sales: ${highest_sales:.2f}
        Lowest Sales: ${lowest_sales:.2f}
        ===============================================""")