# Platform Monitor script for Hubot

## Installation

Add the package `hubot-platform-monitor` as a dependency in your Hubot `package.json file.

	"dependencies": {
		"hubot-platform-monitor": "git://github.com/jivesoftware/hubot-platform-monitor.git"
	}

Run the following command to make sure the package is installed.

	$ npm install

To enable the script, add the `hubot-jira-lookup` entry to the `external-scripts.json` file (you may need to create this file, if it is not present or if you upgraded from Hubot < 2.4).

	["hubot-platform-monitor"]

## Configuration

There is no config.

## Testing

In the testing directory there are 3 json documents, using curl you can post them to hubot and see the output. This is handy so you don't have to wait for builds to fail.

    curl -i -X POST --data @1_started_failure.json http://<hubot_host>:8080/hubot/jenkins-notify?room=<room_identifier>
=======
