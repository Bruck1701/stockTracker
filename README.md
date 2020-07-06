# Investment Tracker App

This is a Ruby on Rails project for a template of a social media model with users and investments. Users can follow other users and track investments such as stocks and cryptocurrency. The user can search for new investments or track investments that his friends are tracking.


Technical and Development specifications:

* Ruby version: 2.7.0
* Rails version: 6.0.3.2

* DB dependencies:
* Dev setting: Sqlite3
* Prod setting: PostgreSQL

# Configuration instruction:
You need to register with <a href=//iexcloud.io/> iex-cloud </a> to get the publishable_token and secret_token to be able to use their API. 
With these tokens, you install the figaro gem (already included in the Gemfile) and paste the tokens in the application.yml file. 
To deploy the app to heroku, you need to put theses tokens as config_vars in the heroku settings.

# APIs used:
* <a href=https://github.com/dblock/iex-ruby-client > iex-ruby-client</a> to fetch stock information   
* <a href=https://github.com/Bruck1701/coingecko_client> coingecko_client </a> to fetch cryptocurrency information

# Tests
How to run the test suite: Minitest testing suite. To run the tests: rails test

# Deployment instructions: 
in a local network: rails server -b 0.0.0.0 -p




