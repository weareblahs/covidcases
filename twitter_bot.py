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
 
tweet = "COVID-19 cases in Malaysia as of showdate."

post_result = api.update_status(status=tweet, media_ids=[media.media_id])

print(post_result)
