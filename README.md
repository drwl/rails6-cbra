# Rails 6 practice application

This applications follows along Component-based Rails Applications book by Stephan Hagemann.

More information: https://cbra.info/

## Notes
### Page 31
I had no issue running `bin/rails db:drop db:create db:migrate` from the main app.

## Issues Encountered
### Page 28
`ArgumentError: Trying to register Bundler::GemfileError for status code 4 but Bundler::GemfileError is already registered`

After generating game and team scaffolds, when trying to run `bin/rails db:migrate` in `components/app_component`, I ran into the above issue. This was an issue with [rubygems](https://github.com/rubygems/rubygems), updating your rubygems to the latest should fix it.

`gem update --system`

[Link to the Github issue](https://github.com/rubygems/rubygems/issues/3284) on rubygems repo.