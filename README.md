# Solidus Solr
===========
# Solidus Newsletter
[![Build Status](https://travis-ci.org/jtapia/solidus_solr.svg?branch=master)](https://travis-ci.org/jtapia/solidus_solr)<br />

Basic Overview
-----

Add a the full-search ability to your Solidus site.

Setup
-----

Add this extension to your Gemfile:

```ruby
gem 'solidus_newsletter', github: 'jtapia/solidus_newsletter'
```

Then run:

```
bundle exec rails g solidus_solr:install
```

Using the recommendations forms
-----

```ruby
<%= render partial: 'spree/shared/up_sale_products' %>
<%= render partial: 'spree/shared/cross_sale_products' %>
```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs, and [Rubocop](https://github.com/bbatsov/rubocop) static code analysis. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'solidus_solr/factories'
```

Copyright (c) 2018 [name of extension creator], released under the New BSD License


