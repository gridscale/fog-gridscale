# Fog::Gridscale

This is the plugin Gem to talk to [gridscale](https://my.gridscale.io/) clouds via fog.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fog-gridscale'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fog-gridscale

## Usage

### Initial Setup


# Getting started: the compute service

You'll need a gridscale account, user uuid and an API token to use this provider.

Get one from https://my.gridscale.io/APIs/

Write down the Access Token.

## Connecting, retrieving and managing server objects

.

First, create a connection to the host:

```ruby
require 'fog/gridscale'
require 'pp'
gridscale = Fog::Compute.new({
                              :provider => 'gridscale',
                              :api_token =>  'your token',
                              :user_uuid => 'your user uuid',

                          })
```


## Listing servers

Listing servers and attributes:

```ruby
gridscale.servers.each do |server|
  puts server.object_uuid
  puts server.name
  puts server.cores
  puts server.memory
end
```

## Server creation

Creating a new server:

```ruby
server = gridscale.servers.create :name => 'foobar',
                               :cores  => 2,
                               :memory => 4,
                               
```

## Get a server
```ruby
gridscale.servers.get(server_uuid)
```

## Update a server
```ruby
gridscale.server_update(server_uuid, payload)

```


