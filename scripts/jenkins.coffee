moment = require('moment-timezone')
module.exports = (robot) ->
 jenkins_url = process.env.JENKINS_URL
 robot.hear  /ci (.+)\s(.+)/i, (msg) ->
  job = msg.match[1].replace /^\s+|\s+$/g, ""
  env = msg.match[2].replace /^\s+|\s+$/g, ""

  switch job
   when "web"
    if env == 'test' then jenkins_url+="/view/WEB/job/Web_Test_Deploy/lastStableBuild/api/json"
    if env == 'staging' then jenkins_url+="/view/WEB/job/Web_Staging_Deploy/lastStableBuild/api/json"
   when "bigdata"
    if env == 'test' then jenkins_url+="/job/Bigdata360/job/Bigdata360_Test_Deploy/lastStableBuild/api/json"
   when "sso"
    if env == 'uat' then
    if env == 'staging' then
   when "api"
    if env == 'uat' then
    if env == 'staging' then
   else
    msg.send "did not match anything"

  msg.http("#{jenkins_url}")
   .headers(Accept: 'application/json')
   .get() (err, res, body) ->
    data = JSON.parse(body)
    date = new Date(data.timestamp)
    AU = moment(date).tz("Australia/Sydney").format('MMMM Do YYYY, h:mm:ss a')
    BRANCH = data.actions[0].parameters[5].value
    msg.reply "Current Branch deployed for #{job.toUpperCase()} in #{env.toUpperCase()} is #{BRANCH.toUpperCase()}, Artifact Number is #{data.actions[0].parameters[6].value} at #{AU}"

