const dotenv = require('dotenv');
const lodash = require('lodash');

const result = dotenv.config();

let envs;

if (!('error' in result)) {
  envs = result.parsed;
} else {
  envs = {};
  lodash.each(process.env, (value, key) => envs[key] = value);
  console.log(envs)
}

module.exports = envs;