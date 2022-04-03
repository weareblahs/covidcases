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

print("Uploading 1 of 17...")
media = api.media_upload(gitworkspace + "/img/cases.png")
tweet = "COVID-19 cases in Malaysia as of " + showdate + ". Open this thread for state information. (1/17) \n#COVID19 #COVID19Cases #CoronavirusCases"
original_tweet = api.update_status(status=tweet, media_ids=[media.media_id])

print("Uploading 2 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Johor.png")
tweet = "COVID-19 cases in Johor as of " + showdate + ". (2/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=original_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 3 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Kedah.png")
tweet = "COVID-19 cases in Kedah as of " + showdate + ". (3/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 4 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Kelantan.png")
tweet = "COVID-19 cases in Kelantan as of " + showdate + ". (4/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 5 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Melaka.png")
tweet = "COVID-19 cases in Melaka as of " + showdate + ". (5/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 6 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Negeri Sembilan.png")
tweet = "COVID-19 cases in Negeri Sembilan as of " + showdate + ". (6/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 7 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Pahang.png")
tweet = "COVID-19 cases in Pahang as of " + showdate + ". (7/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 8 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Perak.png")
tweet = "COVID-19 cases in Perak as of " + showdate + ". (8/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 9 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Perlis.png")
tweet = "COVID-19 cases in Perlis as of " + showdate + ". (9/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 10 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Pulau Pinang.png")
tweet = "COVID-19 cases in Pulau Pinang as of " + showdate + ". (10/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 11 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Sabah.png")
tweet = "COVID-19 cases in Sabah as of " + showdate + ". (11/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 12 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Sarawak.png")
tweet = "COVID-19 cases in Sarawak as of " + showdate + ". (12/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 13 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Selangor.png")
tweet = "COVID-19 cases in Selangor as of " + showdate + ". (13/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 14 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Terengganu.png")
tweet = "COVID-19 cases in Terengganu as of " + showdate + ". (14/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 15 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Kuala Lumpur.png")
tweet = "COVID-19 cases in Kuala Lumpur as of " + showdate + ". (15/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 16 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Labuan.png")
tweet = "COVID-19 cases in Labuan as of " + showdate + ". (16/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

print("Uploading 17 of 17...")
media = api.media_upload(gitworkspace + "/img/cases_Putrajaya.png")
tweet = "COVID-19 cases in Putrajaya as of " + showdate + ". (17/17)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)