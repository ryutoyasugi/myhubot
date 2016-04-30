# Description:
#   定期実行処理
#
# Commands:
#   hubot cron - cron
cronJob = require('cron').CronJob
cheerio = require 'cheerio'
request = require 'request'

module.exports = (robot) ->
  # 定期実行処理の設定
  cronjob = new cronJob('00 * * * * *', () =>
    # スクレイピング対象
    targetUrl = "http://qrank.wbsrv.net"
    request targetUrl, (_, res) ->
      # スクレイピング
      $ = cheerio.load res.body
      articleUrl = $('tbody a').first().attr('href')
      # Slackに投稿
      envelope = room: "hubot"
      robot.send envelope, articleUrl
  )
  cronjob.start()