# Rails 6 practice application

This applications follows along Component-based Rails Applications book by Stephan Hagemann.

More information: https://cbra.info/

## Notes
### Page 39-40
Author makes argument for locking down dependencies with specific versions. This is done to ensure there's no drift between what's tested and what's in production.

Question: What happens if components have dependencies on the same gem, but of different versions. Does the component structure ensure there is no interference or namespace collision?.

### Page 31
I had no issue running `bin/rails db:drop db:create db:migrate` from the main app.

## Issues Encountered
### Page 46-47
After creating the prediction code and referencing the path helpers, we need to add it to `components/app_component/config/routes.rb`. Otherwise I see `undefined local variable or method `new_prediction_path'` when loading `localhost:3000`.

I've created an [errata ticket](https://github.com/shageman/component-based-rails-applications-book/issues/10) for it.

### Page 28
`ArgumentError: Trying to register Bundler::GemfileError for status code 4 but Bundler::GemfileError is already registered`

After generating game and team scaffolds, when trying to run `bin/rails db:migrate` in `components/app_component`, I ran into the above issue. This was an issue with [rubygems](https://github.com/rubygems/rubygems), updating your rubygems to the latest should fix it.

`gem update --system`

[Link to the Github issue](https://github.com/rubygems/rubygems/issues/3284) on rubygems repo.