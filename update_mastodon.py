from mastodon import Mastodon

#   Set up Mastodon
mastodon = Mastodon(
    access_token = 'EIksLN1wXrSw1oBHsEb0bh3c_Zh8y-PzHqfS2g3_oxI',
    api_base_url = 'https://botsin.space/'
)

media1 = mastodon.media_post("img/cases.jpg")
media2 = mastodon.media_post("img/deaths.jpg")
mastodon.status_post("Latest cases, updated manually for some reason. Does this worked?", media_ids=[media1,media2])