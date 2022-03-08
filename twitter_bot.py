import tweepy
import os

consumera = os.environ["TWICK"]
consumerb = os.environ["TWICS"]
accessa = os.environ["TWIAT"]
accessb = os.environ["TWIATS"]
gitworkspace = os.environ["GITHUB_WORKSPACE"]

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
 
tweet = "Test tweet with latest cases"
post_result = api.update_status(status=tweet, media_ids=[media.media_id])

print(post_result)
