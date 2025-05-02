import { AtpAgent } from "@atproto/api";
import { checkPost, getData } from "./getData.js";
const postToBluesky = async () => {
  // bluesky configuration
  const agent = new AtpAgent({
    service: "https://bsky.social",
  });

  const data = await getData();
  let post1 = `COVID-19 cases as of ${data.date.toDateString()} (1/2):\n`;
  let post2 = `COVID-19 cases as of ${data.date.toDateString()} (2/2):\n`;
  //   data found, returning stuff...

  const hasDuplicate = checkPost(
    "COVID-19 cases as of ${data.date.toDateString()}"
  );
  for (let i = 0; i <= 9; i++) {
    post1 += `${data.data[i].state}: ${data.data[i].cases_new} cases\n`;
  }

  for (let i = 10; i <= 16; i++) {
    post2 += `${data.data[i].state}: ${data.data[i].cases_new} cases\n`;
  }
  console.log(post1);
  console.log(post2);

  console.log("Checking for duplicates...");
  if (hasDuplicate) {
    console.log("No duplicates found. Logging into Bluesky...");
    await agent.login({
      identifier: process.env.BSKY_USERNAME,
      password: process.env.BSKY_PASSWORD,
    });
    console.log("Posting post 1 of 2...");
    await agent.post({
      text: post1,
    });
    console.log("Posting post 2 of 2...");
    await agent.post({
      text: post2,
    });
    console.log("Successful");
  } else {
    console.log(
      "Duplicate post on mycovidcasesbot.bsky.social found. Exiting."
    );
    return;
  }
};

postToBluesky();
