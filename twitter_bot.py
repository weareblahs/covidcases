import tweepy
import os
from datetime import date, timedelta

consumera = os.environ["TWICK"]
consumerb = os.environ["TWICS"]
accessa = os.environ["TWIAT"]
accessb = os.environ["TWIATS"]
gitworkspace = os.environ["GITHUB_WORKSPACE"]

today = date.today()
yesterday = today - timedelta(days = 1)
showdate = yesterday.strftime("%B %d %Y")

auth = tweepy.OAuthHandler(
            consumera,
            consumerb
            )
auth.set_access_token(
            accessa,
            accessb
            )
api = tweepy.API(auth)

media = api.media_upload(gitworkspace + "/img/cases.png")
tweet = "COVID-19 cases in Malaysia as of " + showdate + ". Open this thread for state information. (1/16) \n#COVID19 #COVID19Cases #CoronavirusCases"
original_tweet = api.update_status(status=tweet, media_ids=[media.media_id])

media = api.media_upload(gitworkspace + "/img/cases_Kedah.png")
tweet = "COVID-19 cases in Kedah as of " + showdate + ". (2/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=original_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Kelantan.png")
tweet = "COVID-19 cases in Kelantan as of " + showdate + ". (3/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Melaka.png")
tweet = "COVID-19 cases in Melaka as of " + showdate + ". (4/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Negeri Sembilan.png")
tweet = "COVID-19 cases in Negeri Sembilan as of " + showdate + ". (5/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Pahang.png")
tweet = "COVID-19 cases in Pahang as of " + showdate + ". (6/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Perak.png")
tweet = "COVID-19 cases in Perak as of " + showdate + ". (7/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Perlis.png")
tweet = "COVID-19 cases in Perlis as of " + showdate + ". (8/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Pulau Pinang.png")
tweet = "COVID-19 cases in Pulau Pinang as of " + showdate + ". (9/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Sabah.png")
tweet = "COVID-19 cases in Sabah as of " + showdate + ". (10/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Sarawak.png")
tweet = "COVID-19 cases in Sarawak as of " + showdate + ". (11/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Selangor.png")
tweet = "COVID-19 cases in Selangor as of " + showdate + ". (12/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Terengganu.png")
tweet = "COVID-19 cases in Terengganu as of " + showdate + ". (13/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Kuala Lumpur.png")
tweet = "COVID-19 cases in Kuala Lumpur as of " + showdate + ". (14/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Labuan.png")
tweet = "COVID-19 cases in Labuan as of " + showdate + ". (15/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)

media = api.media_upload(gitworkspace + "/img/cases_Putrajaya.png")
tweet = "COVID-19 cases in Putrajaya as of " + showdate + ". (16/16)"
reply_tweet = api.update_status(status=tweet, media_ids=[media.media_id], in_reply_to_status_id=reply_tweet.id, auto_populate_reply_metadata=True)