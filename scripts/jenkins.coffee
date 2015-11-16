moment = require('moment-timezone')
module.exports = (robot) ->
 
 robot.hear  /ci\s(.+)\s(.+)/i, (msg) ->
  jenkins_url = process.env.JENKINS_URL 
  job = msg.match[1].replace /^\s+|\s+$/g, ""
  env = msg.match[2].replace /^\s+|\s+$/g, ""

  switch job
   when "web"
    if env == 'test' then jenkins_url+="/view/WEB/job/Web_Test_Deploy/lastStableBuild/api/json"
    if env == 'staging' then jenkins_url+="/view/WEB/job/Web_Staging_Deploy/lastStableBuild/api/json"
   when "bigdata"
    if env == 'test' then jenkins_url+="/job/Bigdata360/job/Bigdata360_Test_Deploy/lastStableBuild/api/json"
   when "sso"
    if env == 'uat' then jenkins_url+="/view/Grails%20projects/job/SSO/job/SSO_UAT_Deploy/lastStableBuild/api/json"
    if env == 'staging' then  jenkins_url+="/view/Grails%20projects/job/SSO/job/SSO_STAGING_Deploy/lastStableBuild/api/json"
   when "api"
    if env == 'uat' then jenkins_url+="/view/Grails%20projects/job/API/job/API_UAT_Deploy/lastStableBuild/api/json"
    if env == 'staging' then jenkins_url+="/view/Grails%20projects/job/API/job/API_STAGING_Deploy/lastStableBuild/api/json"
   when "clerk"
    if env == 'uat' then jenkins_url+="/view/Grails%20projects/job/Clerk/job/CLERK_UAT_Deploy/lastStableBuild/api/json"
    if env == 'staging' then jenkins_url+="/view/Grails%20projects/job/Clerk/job/CLERK_STAGING_Deploy/lastStableBuild/api/json"
   when "bankdata"
    if env == 'test' then jenkins_url+="view/Grails%20projects/job/BankDS/job/BankData_TEST_Deploy/lastStableBuild/api/json"
   else
    msg.send "Mate did not find a match, inform my creator"

  msg.http("#{jenkins_url}")
   .headers(Accept: 'application/json')
   .get() (err, res, body) ->
    data = JSON.parse(body)
    date = new Date(data.timestamp)
    AU = moment(date).tz("Australia/Sydney").format('MMMM Do YYYY, h:mm:ss a')
    BRANCH = data.actions[0].parameters[5].value
    msg.reply "Current Branch deployed for #{job.toUpperCase()} in #{env.toUpperCase()} is #{BRANCH.toUpperCase()}, Artifact Number is #{data.actions[0].parameters[6].value} at #{AU}"

