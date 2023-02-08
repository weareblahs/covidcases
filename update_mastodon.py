from mastodon import Mastodon
import os
access = str(os.environ["ACCESS"])
#   Set up Mastodon
mastodon = Mastodon(
    access_token = access,
    api_base_url = 'https://botsin.space/'
)

media1 = mastodon.media_post("img/cases.jpg")
media2 = mastodon.media_post("img/deaths.jpg")
mastodon.status_post("Latest cases, updated manually for some reason. Does this worked?", media_ids=[media1,media2])