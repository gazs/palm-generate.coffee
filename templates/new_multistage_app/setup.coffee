cli = require 'cli'

exports.setup = ->
  if directory_exists(app_dir) and not options.overwrite
    cli.fatal "directory exists"

  wrench = require 'wrench'
  source = "./templates/#{options.template}"
  destination = "#{process.cwd()}/#{app_dir}"
  wrench.copyDirSyncRecursive(source,destination)
  # delete setup.coffee from destination
  cli.native.fs.unlinkSync("#{destination}/setup.coffee")

  # set appinfo.json
  cli.native.fs.writeFile "#{destination}/appinfo.json", JSON.stringify(appinfo), (err) ->
    cli.error(err) if err

