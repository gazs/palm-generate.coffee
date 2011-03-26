cli = require 'cli'
[path, fs] = [cli.native.path, cli.native.fs]

exports.setup = ->
  if directory_exists(app_dir) and not options.overwrite
    cli.fatal "directory exists"

  wrench = require 'wrench'
  source = path.join(mypath, "./templates/#{options.template}")
  destination = "#{process.cwd()}/#{app_dir}"
  wrench.copyDirSyncRecursive(source,destination)
  # delete setup.coffee from destination
  fs.unlinkSync("#{destination}/setup.coffee")

  # set appinfo.json
  fs.writeFile "#{destination}/appinfo.json", JSON.stringify(appinfo), (err) ->
    cli.error(err) if err

