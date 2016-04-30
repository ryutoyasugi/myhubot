# Description:
#   定期実行処理
cronJob = require('cron').CronJob

module.exports = (robot) ->
  cronjob = new cronJob('00 30 7 * * 1-5', () =>
    envelope = room: "hubot"
    robot.send envelope, "Good Morning!"
  )
  cronjob.start()