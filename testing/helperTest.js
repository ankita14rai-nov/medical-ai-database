const { getSymptomSeverity } = require("../services/databaseService");

async function test() {

    try {

        const result = await getSymptomSeverity("itching");

        console.log(result);

    } catch (error) {

        console.error(error);

    }

}

test();
