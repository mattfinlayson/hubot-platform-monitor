# Description:
#   Platform Monitor
#
# Dependencies:
#   Node
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   savagegus
HUBOT_PLATFORM_MONITOR_ROOM = ""
ROOM = "#mattfinlayson/$kegbot;163121660db02dc9"
TIMEZONE = "America/Los_Angeles"
RUN_SCHEDULE = "*/1 * * * *" # Every 5 minutes

#cronJob = require('cron').CronJob
http = require("http");

module.exports = (robot) ->
  #announce = new cronJob RUN_SCHEDULE,
  #  ->
  #    options = { host: 'soa-dev-app1.phx1.jivehosted.com', port: '63000', path: '/monitor' }
  #    http.get options, (res) ->
  #      console.log "in cron"
  #      data = ''
  #      res.on 'data', (chunk) ->
  #        data += chunk.toString()
  #      res.on 'end'm, () ->
  #        console.log data
  #      robot.messageRoom ROOM, data
  #  null,
  #  true,
  #  TIMEZONE

  robot.respond /platform\-monitor dev/i, (msg) ->
    try
      msg.http('http://soa-dev-app1.phx1.jivehosted.com:63000/monitor')
        .get() (err, res, body) ->
          status = JSON.parse(body)
          monitorStates = status.monitorStates
          console.log status
          payload = ""
          for state in status.monitorStates
            name = ""
            if state.name != null
              name = state.name
            pass = "DOWN"
            if state.pass != null
              if state.pass == true
                pass = "* UP *"
            message = "no message"
            if state.message != null
              message = state.message
            payload += "SOA-DEV: #{name} - #{pass} #{message}\n"
          msg.send payload
    catch e
      msg.send "It looks like the platform monitor is down. Freak out."
  robot.respond /platform\-monitor test/i, (msg) ->
    try
      msg.http('http://soa-test-app1.phx1.jivehosted.com:63000/monitor')
        .get() (err, res, body) ->
          status = JSON.parse(body)
          monitorStates = status.monitorStates
          console.log status
          payload = ""
          for state in status.monitorStates
            name = ""
            if state.name != null
              name = state.name
            pass = "DOWN"
            if state.pass != null
              if state.pass == true
                pass = "* UP *"
            message = "no message"
            if state.message != null
              message = state.message
            payload += "SOA-TEST: #{name} - #{pass} #{message}\n"
          msg.send payload
    catch e
      msg.send "It looks like the platform monitor is down. Freak out."
check_service = (cb) ->
  console.log "here"
  options = { host: 'soa-dev-app1.phx1.jivehosted.com', port: '63000', path: '/monitor' }
  msg.http.get options, (err, res, body) ->
    msg.send JSON.parse(body)