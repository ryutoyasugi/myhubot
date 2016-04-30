# Description:
#   定期実行処理
cronJob = require('cron').CronJob

module.exports = (robot) ->
  cronjob = new cronJob('0 * * * * *', () =>
    envelope = room: "hubot"
    robot.send envelope, "Oh!"
  )
  cronjob.start()