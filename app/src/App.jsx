import { useEffect, useState } from "react";
import "./style.css";
import { getData } from "./getData";
function App() {
  const [data, setData] = useState({ date: "...", cases_new: "..." });
  useEffect(() => {
    async function get() {
      const caseData = await getData();
      if (caseData) {
        if (caseData.data.filter((d) => d.state == "Malaysia").length != 0) {
          setData(
            caseData.data.filter((d) => d.state == "Malaysia")[
              caseData.data.filter((d) => d.state == "Malaysia").length - 1
            ]
          );
        }
      }
      // process data - only get the latest malaysia data since this is for national cases
    }
    get();
  }, []);

  console.log(data);

  return (
    <div
      style={{
        width: "100vw",
      }}
    >
      <div class="centertextv2">
        <h1
          style={{
            fontSize: "3em",
          }}
        >
          <center>COVID-19 Cases in Malaysia as of {data.date}</center>
        </h1>
      </div>
      <div class="">
        <center>
          <h1>{data.cases_new}</h1>
        </center>
      </div>
      <h2>
        <center>
          {/* <a
            href="https://weareblahs.github.io/covidcases/state/RURL.html"
            class="redbox"
          >
            {" "}
            View REV{" "}
          </a> */}
        </center>
      </h2>
      <h2>
        {/* <center>
          <a href="https://weareblahs.github.io/covidcases/navi" class="redbox">
            {" "}
            More statistics{" "}
          </a>
        </center> */}
      </h2>
      <h2>
        <center>
          {/* <a
            href="https://weareblahs.github.io/covidcases/img/TYPE_STATENAME.jpg"
            download="COVID-19_TYPE_in_STATENAME_DOWNLOAD_DATE.jpg"
            class="redbox"
          >
            {" "}
            Save as image{" "}
          </a> */}
        </center>
      </h2>
      <h2>
        <center>
          This website is available on Twitter / X as a bot, which posts updates
          whenever there is an update on cases.{" "}
          <a href="https://twitter.com/mycovidcasesbot" class="sociallink">
            <u>Follow on Twitter</u>
          </a>
        </center>
      </h2>
      <h2>
        <center>
          This website is also on Bluesky Social.{" "}
          <a href="https://mycovidcasesbot.bsky.social" class="sociallink">
            <u>Follow on Bluesky</u>
          </a>
        </center>
      </h2>
      <h3>
        <center>Realtime version. Updates when you refresh.</center>
        <center>State cases coming soon.</center>
        <center>
          <a href="https://github.com/weareblahs/covidcases">
            <u>Source code</u>
          </a>
        </center>
      </h3>{" "}
    </div>
  );
}

export default App;
