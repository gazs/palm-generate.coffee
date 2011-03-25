#!/usr/bin/env coffee
cli = require 'cli'

cli.enable('version')
   .setApp('./package.json')

cli.parse
  overwrite: ['f', 'Overwrite existing files']
  list: ['l', 'List available templates']
  template: ['t', 'Use the template named TEMPLATE', 'string']
  property: ['p', 'Sets the property', 'string']

global.options = cli.options
global.app_dir = cli.args[0]

global.get_templates = () ->
  cli.native.fs.readdirSync('./templates')

global.directory_exists = (dir) ->
  cli.native.path.existsSync("#{process.cwd()}/" + dir)

if options.list
  templates = get_templates()
  console.log templates
  process.exit()

options.property ?= "{}"
global.properties = JSON.parse(options.property)
global.appinfo =
  id: properties.id || "com.yourdomain.#{app_dir}"
  version: properties.version || "1.0.0"
  vendor: properties.vendor || "My Company"
  type: properties.type || "web"
  main: properties.main || "index.html"
  title: properties.title || cli.args[0]
  icon: properties.icon || "icon.png"

if options.template and cli.args.length
  if options.template in get_templates()
    template_magic = require "./templates/#{options.template}/setup.coffee"
    template_magic.setup()