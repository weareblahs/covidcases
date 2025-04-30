import axios from "axios";

export const getData = async () => {
  var today = new Date();
  let data = [];
  while (data.length == 0) {
    today.setDate(today.getDate() - 1);
    var formatted = today.toJSON().slice(0, 10);
    const res = await axios.get(
      `https://api.data.gov.my/data-catalogue/?id=covid_cases&date_start=${formatted}@date`
    );
    if (data.length == 0) {
      console.log(`No data for ${formatted}`);
    }
    data = res.data;
    if (data.length != 0) {
      console.log(
        `Data found for ${formatted}. Returning data for current function...`
      );
    }
  }
  return { date: today, data };
};
