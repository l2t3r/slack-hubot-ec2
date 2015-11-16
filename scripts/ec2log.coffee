moment = require('moment-timezone')
TEST_ACCOUNT_ID = process.env.TEST_ACCOUNT_ID
PROD_ACCOUNT_ID = process.env.PROD_ACCOUNT_ID
LIMIT = 50
module.exports = (robot) ->
 robot.hear  /ec2log\s([A-Za-z\-]+)/i, (msg) ->
  log = msg.match[1].replace /^\s+|\s+$/g, ""
  LOGENTRIES_URL = "https://pull.logentries.com/"
  date = new Date()
  START = moment(date).subtract(60, 'seconds').valueOf()
  switch log
   when "web-test"
    LOGENTRIES_URL+= "#{TEST_ACCOUNT_ID}/hosts/SF360-Web-Test/CatalinaLog/?start=#{START}&limit=#{LIMIT}"
   when "web-prod"
    LOGENTRIES_URL+= "#{PROD_ACCOUNT_ID}/hosts/SF360-Web-Production/CatalinaLog/?start=#{START}&limit=#{LIMIT}"
   else
    return
   
  msg.http("#{LOGENTRIES_URL}")
   .get() (err, res, body) ->
    msg.reply "#{body}"
