rails_server_timings
====================

Rails support for returning [Server Timing](http://wicg.github.io/server-timing/) headers on requests providing instrumentation information to in-browser developer tools.


Download
--------

* Github: https://github.com/dpogue/rails_server_timings

* Gem:

      $ gem install rails_server_timings


Configuration
-------------

Add `rails_server_timings` to your Gemfile:

```ruby
gem 'rails_server_timings'
```

By default, Rails will now include the `Server-Timing` response header on every controller response.

To disable, set `config.server_timings.enabled` to false in your application configuration.


Contributing
------------

Contributions of bug reports, feature requests, and pull requests are greatly appreciated!

Please note that this project is released with a [Contributor Code of Conduct](https://github.com/dpogue/rails_server_timings/blob/master/CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.


Licence
-------

Copyright © 2017 Darryl Pogue
Licensed under the MIT Licence.
