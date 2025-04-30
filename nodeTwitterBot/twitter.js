import { getData } from "./getData.js";
import { ApiResponseError, TwitterApi } from "twitter-api-v2";
const postToTwitter = async () => {
  const data = await getData();
  let tweet1 = `COVID-19 cases as of ${data.date.toDateString()} (1/2):\n`;
  let tweet2 = `COVID-19 cases as of ${data.date.toDateString()} (2/2):\n`;
  const twitterClient = new TwitterApi({
    appKey: process.env.TWI_APPKEY,
    appSecret: process.env.TWI_APPSECRET,
    accessToken: process.env.TWI_ACCESSTOKEN,
    accessSecret: process.env.TWI_ACCESSSECRET,
  });
  //   data found, returning stuff...
  for (let i = 0; i <= 9; i++) {
    tweet1 += `${data.data[i].state}: ${data.data[i].cases_new} cases\n`;
  }

  for (let i = 10; i <= 16; i++) {
    tweet2 += `${data.data[i].state}: ${data.data[i].cases_new} cases\n`;
  }
  console.log(tweet1);
  console.log(tweet2);

  const jsTweets = await twitterClient.v2.search(
    `"COVID-19 cases as of ${data.date.toDateString()}" from:MYCOVIDCasesBot` // Test with data after 1 day
  );

  try {
    if (jsTweets.data.meta.result_count != 0) {
      console.log(
        "Data exists on Twitter account MYCOVIDCasesBot. Skipping tweet proccess."
      );
    } else {
      console.log("Tweeting tweet 1 of 2...");
      await twitterClient.v2.tweet(tweet1);
      console.log("Tweeting tweet 2 of 2...");
      await twitterClient.v2.tweet(tweet2);
      console.log("Successful");
    }
  } catch (ApiResponseError) {
    if (ApiResponseError.rateLimit) {
      console.log(
        `Rate limited: reset on ${ApiResponseError.rateLimit.reset} (epoch)`
      );
    }
  }
};

postToTwitter();
