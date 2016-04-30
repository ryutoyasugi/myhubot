# Description:
#   スクレピング
#
# Commands:
#   hubot cheerio - scraping
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.hear /URL$/i, (msg) ->
    targetUrl = "http://qrank.wbsrv.net"
    msg.http(targetUrl).get() (err, res, body) ->
      $ = cheerio.load(body)
      articleUrl = $('tbody a').first().attr('href')
      msg.send articleUrl
