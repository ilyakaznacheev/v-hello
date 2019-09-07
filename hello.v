module main

import (
	vweb
)

const (
	Port = 8081
)

struct App {
pub mut:
	vweb vweb.Context
	itr  int
}

pub fn (app mut App) init() {
	app.vweb.handle_static('.')
}

pub fn (app mut App) hello() {
	app.vweb.text('hi, your request url is ' + app.vweb.req.url)
}

fn main() {
	println('hello world')
	vweb.run<App>(Port)
}