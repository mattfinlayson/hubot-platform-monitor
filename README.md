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

There are three configuration values required for jira-lookup to work properly. 

* HUBOT_JIRA_LOOKUP_USERNAME
* HUBOT_JIRA_LOOKUP_PASSWORD
* HUBOT_JIRA_LOOKUP_URL
