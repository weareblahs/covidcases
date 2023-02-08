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

print("Uploading post 1 of 9...")
media1 = mastodon.media_post("img/cases.png")
media2 = mastodon.media_post("img/deaths.png")
mastodon.status_post("COVID-19 cases and deaths in Malaysia as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2])

print("Uploading post 2 of 9...")
media1 = mastodon.media_post("img/cases_Johor.png")
media2 = mastodon.media_post("img/deaths_Johor.png")
media3 = mastodon.media_post("img/cases_Kedah.png")
media4 = mastodon.media_post("img/deaths_Kedah.png")
mastodon.status_post("COVID-19 cases and deaths in Johor and Kedah as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2,media3,media4])

print("Uploading post 3 of 9...")
media1 = mastodon.media_post("img/cases_Kelantan.png")
media2 = mastodon.media_post("img/deaths_Kelantan.png")
media3 = mastodon.media_post("img/cases_Melaka.png")
media4 = mastodon.media_post("img/deaths_Melaka.png")
mastodon.status_post("COVID-19 cases and deaths in Kelantan and Melaka as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2,media3,media4])

print("Uploading post 4 of 9...")
media1 = mastodon.media_post("img/cases_Negeri Sembilan.png")
media2 = mastodon.media_post("img/deaths_Negeri Sembilan.png")
media3 = mastodon.media_post("img/cases_Pahang.png")
media4 = mastodon.media_post("img/deaths_Pahang.png")
mastodon.status_post("COVID-19 cases and deaths in Negeri Sembilan and Pahang as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2,media3,media4])

print("Uploading post 5 of 9...")
media1 = mastodon.media_post("img/cases_Perak.png")
media2 = mastodon.media_post("img/deaths_Perak.png")
media3 = mastodon.media_post("img/cases_Perlis.png")
media4 = mastodon.media_post("img/deaths_Perlis.png")
mastodon.status_post("COVID-19 cases and deaths in Perak and Perlis as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2,media3,media4])


print("Uploading post 6 of 9...")
media1 = mastodon.media_post("img/cases_Pulau Pinang.png")
media2 = mastodon.media_post("img/deaths_Pulau Pinang.png")
media3 = mastodon.media_post("img/cases_Sabah.png")
media4 = mastodon.media_post("img/deaths_Sabah.png")
mastodon.status_post("COVID-19 cases and deaths in Pulau Pinang and Sabah as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2,media3,media4])

print("Uploading post 7 of 9...")
media1 = mastodon.media_post("img/cases_Sarawak.png")
media2 = mastodon.media_post("img/deaths_Sarawak.png")
media3 = mastodon.media_post("img/cases_Selangor.png")
media4 = mastodon.media_post("img/deaths_Selangor.png")
mastodon.status_post("COVID-19 cases and deaths in Sarawak and Selangor as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2,media3,media4])

print("Uploading post 8 of 9...")
media1 = mastodon.media_post("img/cases_Terengganu.png")
media2 = mastodon.media_post("img/deaths_Terengganu.png")
media3 = mastodon.media_post("img/cases_Kuala Lumpur.png")
media4 = mastodon.media_post("img/deaths_Kuala Lumpur.png")
mastodon.status_post("COVID-19 cases and deaths in Terengganu and Kuala Lumpur as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2,media3,media4])

print("Uploading post 9 of 9...")
media1 = mastodon.media_post("img/cases_Labuan.png")
media2 = mastodon.media_post("img/deaths_Labuan.png")
media3 = mastodon.media_post("img/cases_Putrajaya.png")
media4 = mastodon.media_post("img/deaths_Putrajaya.png")
mastodon.status_post("COVID-19 cases and deaths in Labuan and utrajaya as of " + showdate + ". \n#COVID19 #COVID19Cases #CoronavirusCases", media_ids=[media1,media2,media3,media4])