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

original_tweet = api.update_status(status="Thread test (1/2)")
reply1_tweet = api.update_status(status="Thread test (2/2)", in_reply_to_status_id=original_tweet.id, auto_populate_reply_metadata=true)

#media = api.media_upload(gitworkspace + "/img/cases.png")
 
#tweet = "COVID-19 cases in Malaysia as of " + showdate + ".\nOpen this thread for state information. (1/16) \n#COVID19 #COVID19Cases #CoronavirusCases"

#post_result = api.update_status(status=tweet, media_ids=[media.media_id])

#print(post_result)
