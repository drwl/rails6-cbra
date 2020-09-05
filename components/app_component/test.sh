#!/bin/bash

exit_code=0

echo "*** Running container app specs"
bundle -j8
bin/rails db:reset db:migrate
bundle exec rspec spec
exit_code+=$?

exit $exit_code