#Script to get aws asg ec2 active hosts
child_process = require('child_process')
module.exports = (robot) ->
	cmd="/hubot/scripts/ec2.sh"

	robot.hear /ec2\s([A-Za-z\-]+)\s([A-Za-z1-2\-]+)/i, (msg) ->
	   role = msg.match[1]
	   region = msg.match[2]
	   child_process.exec "#{cmd} #{role} #{region}", (error, stdout, stderr) -> 		
	     msg.send(stdout)
