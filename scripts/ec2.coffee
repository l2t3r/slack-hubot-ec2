#Script to get aws asg ec2 active hosts
child_process = require('child_process')
module.exports = (robot) ->
	cmd="/hubot/scripts/ec2.sh"

	robot.hear /^ec2 (.+)\s(.+)/i, (msg) ->
	   role = msg.match[1]
	   region = msg.match[2]
	   child_process.exec "#{cmd} #{role} #{region}", (error, stdout, stderr) -> 		
	     msg.send(stdout)
