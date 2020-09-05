#!/bin/bash

exit_code=0

echo "*** Running container app specs"
bundle -j8
bundle exec rake db:drop
bundle exec rake environment db:create db:migrate
RAILS_ENV=test bundle exec rake environment db:create db:migrate
bundle exec rspec spec
exit_code+=$?

exit $exit_code