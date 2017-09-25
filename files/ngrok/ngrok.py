#!/usr/bin/env python
import requests
from time import sleep

sleep(5)

response = requests.get('http://localhost:4040/api/tunnels')
json = response.json()
endpoints = list(map(lambda x: {"name": x['name'],
                                "url": x["public_url"]}, json['tunnels']))


# pip install python-twitter
import twitter
consumer_key = "CsFTnKMJbRIfRBAULjl20dIgT"
consumer_secret = "D1pBrJrdGHxXBnrdZEjRwY1q5jWZikECaYtdZOBYadqCgEKvlR"
access_token_key = "848736400161726464-4GJfTme76dN93VEBN3Se0ORChG5hYVK"
access_token_secret = "DmgKguh5lKaSFZgkoWrnDmztsdro3mHisq1NbPAPcMboV"
api = twitter.Api(consumer_key=consumer_key,
                  consumer_secret=consumer_secret,
                  access_token_key=access_token_key,
                  access_token_secret=access_token_secret)
message = "this would be good"

for endpoint in endpoints:
    api.PostUpdate("name:" + endpoint["name"] + " url:" + endpoint['url'])

# print(endpoints)
# print(json['tunnels'])
