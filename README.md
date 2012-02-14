Auction Notifier
================

A Sinatra app built for heroku which will poll an auction house in World of Warcraft.

**This app is currently still under development and not fully functional.**


Setup and Configuration
-----------------------

An account on [Heroku](http://devcenter.heroku.com/articles/quickstart) is required.

Clone the repo and create new heroku app

    git clone git://github.com/bbck/auction-notifier.git
    cd ./auction-notifier
    heroku create --stack cedar

Install the nessacery addons

    heroku addons:add heroku-shared-postgresql:basic
    heroku addons:add ssl:piggyback
    heroku addons:add scheduler:standard
    heroku addons:add mailgun:starter
    
Deploy to heroku

    git push heroku master
    
Create the database and an user account

    heroku run bundle exec rake db:migrate
    heroku run bundle exec rake auction:adduser

Configure a scheduled job for scanning the action house. Options can be tweaked and
multiple jobs can be added, but you are paying for the processessing time of each.

    1. Go to https://heroku-scheduler.herokuapp.com/dashboard
    2. Add a new job with the following options
        - bundle exec rake auctions:parse["region","realm","faction"]
          region can be one of us,eu,kr,cn,tw
          faction either horde or alliance
        - Frequency: Hourly

You should now be up and running! Log in and set items to watch.

Planned Features
----------------

- SMS Notifications
- Support for multiple realms
- Watched item history (pricing, total listings, etc)

Contributing
------------

Contributions are welcome. Please fork the project on github and commit your changes
in a new branch and send a pull request. All pull requests must be fully tested.

License
-------

This app is provided under the MIT License.

copyright (c) 2012 Chris Boyle

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
