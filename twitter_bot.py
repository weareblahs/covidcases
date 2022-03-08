import tweepy
import os

consumera = os.environ["TWICK"]
consumerb = os.environ["TWICS"]
accessa = os.environ["TWIAT"]
accessb = os.environ["TWIATS"]

client = tweepy.Client(consumer_key=consumera,
                       consumer_secret=consumerb,
                       access_token=accessa,
                       access_token_secret=accessb
                       )

response = client.create_tweet(text="Test tweet from GitHub actions.")

print(response)
