from mastodon import Mastodon
from datetime import date, timedelta
import os
access = str(os.environ["ACCESS"])
#   Set up Mastodon
mastodon = Mastodon(
    access_token = access,
    api_base_url = 'https://botsin.space/'
)
print("Setting date...")
today = date.today()
yesterday = today - timedelta(days = 1)
showdate = yesterday.strftime("%d %B %Y")

print("Uploading post 1 of 17...")
media1 = mastodon.media_post("img/cases.jpg")
media2 = mastodon.media_post("img/deaths.jpg")
mastodon.status_post("COVID-19 cases and deaths in Malaysia as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 2 of 17...")
media1 = mastodon.media_post("img/cases_Johor.jpg")
media2 = mastodon.media_post("img/deaths_Johor.jpg")
mastodon.status_post("COVID-19 cases and deaths in Johor as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 3 of 17...")
media1 = mastodon.media_post("img/cases_Kedah.jpg")
media2 = mastodon.media_post("img/deaths_Kedah.jpg")
mastodon.status_post("COVID-19 cases and deaths in Kedah as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 4 of 17...")
media1 = mastodon.media_post("img/cases_Kelantan.jpg")
media2 = mastodon.media_post("img/deaths_Kelantan.jpg")
mastodon.status_post("COVID-19 cases and deaths in Kelantan as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 5 of 17...")
media1 = mastodon.media_post("img/cases_Melaka.jpg")
media2 = mastodon.media_post("img/deaths_Melaka.jpg")
mastodon.status_post("COVID-19 cases and deaths in Melaka as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 6 of 17...")
media1 = mastodon.media_post("img/cases_Negeri Sembilan.jpg")
media2 = mastodon.media_post("img/deaths_Negeri Sembilan.jpg")
mastodon.status_post("COVID-19 cases and deaths in Negeri Sembilan as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 7 of 17...")
media1 = mastodon.media_post("img/cases_Pahang.jpg")
media2 = mastodon.media_post("img/deaths_Pahang.jpg")
mastodon.status_post("COVID-19 cases and deaths in Pahang as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 8 of 17...")
media1 = mastodon.media_post("img/cases_Perak.jpg")
media2 = mastodon.media_post("img/deaths_Perak.jpg")
mastodon.status_post("COVID-19 cases and deaths in Perak as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 9 of 17...")
media1 = mastodon.media_post("img/cases_Perlis.jpg")
media2 = mastodon.media_post("img/deaths_Perlis.jpg")
mastodon.status_post("COVID-19 cases and deaths in Perlis as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])


print("Uploading post 10 of 17...")
media1 = mastodon.media_post("img/cases_Pulau Pinang.jpg")
media2 = mastodon.media_post("img/deaths_Pulau Pinang.jpg")
mastodon.status_post("COVID-19 cases and deaths in Pulau Pinang as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 11 of 17...")
media1 = mastodon.media_post("img/cases_Sabah.jpg")
media2 = mastodon.media_post("img/deaths_Sabah.jpg")
mastodon.status_post("COVID-19 cases and deaths in Sabah as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 12 of 17...")
media1 = mastodon.media_post("img/cases_Sarawak.jpg")
media2 = mastodon.media_post("img/deaths_Sarawak.jpg")
mastodon.status_post("COVID-19 cases and deaths in Sarawak as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 13 of 17...")
media1 = mastodon.media_post("img/cases_Selangor.jpg")
media2 = mastodon.media_post("img/deaths_Selangor.jpg")
mastodon.status_post("COVID-19 cases and deaths in Selangor as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 14 of 17...")
media1 = mastodon.media_post("img/cases_Terengganu.jpg")
media2 = mastodon.media_post("img/deaths_Terengganu.jpg")
mastodon.status_post("COVID-19 cases and deaths in Terengganu as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 15 of 17...")
media1 = mastodon.media_post("img/cases_Kuala Lumpur.jpg")
media2 = mastodon.media_post("img/deaths_Kuala Lumpur.jpg")
mastodon.status_post("COVID-19 cases and deaths in Kuala Lumpur as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 16 of 17...")
media1 = mastodon.media_post("img/cases_Labuan.jpg")
media2 = mastodon.media_post("img/deaths_Labuan.jpg")
mastodon.status_post("COVID-19 cases and deaths in Labuan as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 17 of 17...")
media1 = mastodon.media_post("img/cases_Putrajaya.jpg")
media2 = mastodon.media_post("img/deaths_Putrajaya.jpg")
mastodon.status_post("COVID-19 cases and deaths in Putrajaya as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])