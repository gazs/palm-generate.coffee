# CoffeeScript-based templates and generator for Mojo

The palm-generate.coffee tool tries to fill the WebOS SDK's palm-generate's greatest problem: its lack of extensibility. For extra readability and convenience, both the tool and the included templates ported from the SDK are written in CoffeeScript.

## Usage

palm-generate.coffee accepts the same arguments and options as the original palm-generate, with the difference that a -t template is always required and -p properties must always be valid JSON (no single-quoted strings, keys also have to be quoted).
