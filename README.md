# ITC 73
[![Build
Status](https://secure.travis-ci.org/kaize/itc73.png)](http://travis-ci.org/kaize/itc73)
[![Coverage status](https://coveralls.io/repos/kaize/itc73/badge.png?branch=master)](https://coveralls.io/repos/kaize/itc73/)
[![Coverage status](https://coveralls.io/repos/kaize/itc73/badge.png?branch=develop)](https://coveralls.io/repos/kaize/itc73/)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/kaize/itc73)


## Installation and running way
```sh
  git clone https://github.com/kaize/itc73.git
  cd itc73
  bundle install
  bundle exec rake db:create db:migrate db:seed
  bundle exec unicorn_rails
```

  Теперь в браузере можно будет открыть сайт, по умолчанию он находится
по ссылке http://localhost:8080/
