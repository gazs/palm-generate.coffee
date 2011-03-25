cli = require 'cli'

exports.setup = ->
  unless properties.name
    cli.fatal "name must be set"
  else
    name = properties.name

  try
   sourcefile = cli.native.fs.readFile "#{app_dir}/sources.json", (err, data) ->
    cli.error err if err
    source = JSON.parse(data)
    source.push
      scenes: name
      source: "app/assistants/#{name}-assistant.js"
    if directory_exists(app_dir)
      cli.fatal "scene with that name already exists"
    cli.native.fs.writeFile "#{app_dir}/sources.json", JSON.stringify(source), (err) -> cli.error(err) if err
    
    cli.native.fs.mkdir "#{app_dir}/app/views/#{name}", 0777, (err) ->
      cli.error err if err
      cli.native.fs.writeFile "#{app_dir}/app/views/#{name}/#{name}-scene.html", "autogenerated", (err) ->
        cli.error err if err
  catch e
    cli.fatal e

