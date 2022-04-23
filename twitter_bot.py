import tweepy
import os
from datetime import date, timedelta

consumera = os.environ["TWICK"]
consumerb = os.environ["TWICS"]
accessa = os.environ["TWIAT"]
accessb = os.environ["TWIATS"]
gitworkspace = os.environ["GITHUB_WORKSPACE"]

print("Setting date...")
today = date.today()
yesterday = today - timedelta(days = 1)
showdate = yesterday.strftime("%d %B %Y")

auth = tweepy.OAuthHandler(
            consumera,
            consumerb
            )
auth.set_access_token(
            accessa,
            accessb
            )
api = tweepy.API(auth)

os.chdir(gitworkspace)
print("Uploading 1 of 17...")
filenames = ['img/cases.png', 'img/deaths.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Malaysia as of " + showdate + ". Open this thread for state information. (1/17) \n#COVID19 #COVID19Cases #CoronavirusCases"
original_tweet = api.update_status(status=tweet, media_ids=media_ids)

print("Uploading 2 of 17...")
filenames = ['img/cases_Johor.png', 'img/deaths_Johor.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Johor as of " + showdate + ". (2/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=original_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 3 of 17...")
filenames = ['img/cases_Kedah.png', 'img/deaths_Kedah.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Kedah as of " + showdate + ". (3/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 4 of 17...")
filenames = ['img/cases_Kelantan.png', 'img/deaths_Kelantan.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Kelantan as of " + showdate + ". (4/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 5 of 17...")
filenames = ['img/cases_Melaka.png', 'img/deaths_Melaka.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Melaka as of " + showdate + ". (5/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 6 of 17...")
filenames = ['img/cases_Negeri Sembilan.png', 'img/deaths_Negeri Sembilan.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Negeri Sembilan as of " + showdate + ". (6/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 7 of 17...")
filenames = ['img/cases_Pahang.png', 'img/deaths_Pahang.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Pahang as of " + showdate + ". (7/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 8 of 17...")
filenames = ['img/cases_Perak.png', 'img/deaths_Perak.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Perak as of " + showdate + ". (8/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 9 of 17...")
filenames = ['img/cases_Perlis.png', 'img/deaths_Perlis.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Perlis as of " + showdate + ". (9/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 10 of 17...")
filenames = ['img/cases_Pulau Pinang.png', 'img/deaths_Pulau Pinang.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Pulau Pinang as of " + showdate + ". (10/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 11 of 17...")
filenames = ['img/cases_Sabah.png', 'img/deaths_Sabah.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Sabah as of " + showdate + ". (11/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 12 of 17...")
filenames = ['img/cases_Sarawak.png', 'img/deaths_Sarawak.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Sarawak as of " + showdate + ". (12/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 13 of 17...")
filenames = ['img/cases_Selangor.png', 'img/deaths_Selangor.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Selangor as of " + showdate + ". (13/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 14 of 17...")
filenames = ['img/cases_Terengganu.png', 'img/deaths_Terengganu.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Terengganu as of " + showdate + ". (14/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 15 of 17...")
filenames = ['img/cases_Kuala Lumpur.png', 'img/deaths_Kuala Lumpur.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Kuala Lumpur as of " + showdate + ". (15/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 16 of 17...")
filenames = ['img/cases_Labuan.png', 'img/deaths_Labuan.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Labuan as of " + showdate + ". (16/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 17 of 17...")
filenames = ['img/cases_Putrajaya.png', 'img/deaths_Putrajaya.png']
media_ids = []
for filename in filenames:
     res = api.media_upload(filename)
     media_ids.append(res.media_id)
tweet = "COVID-19 cases and deaths in Putrajaya as of " + showdate + ". (17/17)"
reply_tweet = api.update_status(status=tweet, media_ids=media_ids, in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)