# 冒頭のコメントは必須ではありませんが，入れておくとhelpコマンドにリストアップされます
# Description:
#   Hubotと挨拶.
#
# Commands:
#   hubot hello - Reply with hello

# Hubotのスクリプトはモジュールとして記述し，
# Hubot起動時にrequireされてexportした関数が呼び出されます
module.exports = (robot) ->
  robot.respond /HELLO$/i, (msg) ->
    msg.send "ya!"

  robot.enter (msg) ->
    msg.send "yo #{msg.message.user.name}"

  robot.leave (msg) ->
    msg.send "bye #{msg.message.user.name}"