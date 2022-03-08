import tweepy
import os

CONSUMER_KEY = os.environ['TWICK']
CONSUMER_SECRET = os.environ['TWICS']
ACCESS_SECRET = os.environ['TWIAT']
ACCESS_TOKEN_SECRET = os.environ['TWIATS']

client = tweepy.Client(consumer_key='CONSUMER_KEY',
                       consumer_secret='CONSUMER_SECRET',
                       access_token='ACCESS_SECRET',
                       access_token_secret='TWITTER_ACCESS_TOKEN_SECRET')

# Replace the text with whatever you want to Tweet about
response = client.create_tweet(text="Tweet tweeted from GitHub Actions to ensure that it's working with all the stuffs. Disregard this tweet.")

print(response)