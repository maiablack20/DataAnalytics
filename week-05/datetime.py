# Maia Black 
# 2025-05-13

from datetime import date, time, datetime, timedelta, timezone 

#date(year, month, day)
today = date(2026, 5, 13)
print("Date: ", today)

# time(hour, minute, second, microsecond)
current_time = time(13, 15, 45)
print("Time: ", current_time)

# datetime(year, month, day, hour, minute, second)
current_datetime = datetime(2026, 5, 13, 13, 15, 45)

# timezone 
est = timezone(timedelta(hours = 5))
print(est)

#datetime.now(timezone)
utc_time = datetime.now(timezone.utc)
print("UTC Time: ", utc_time)