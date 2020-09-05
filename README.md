# Rails 6 practice application

This applications follows along Component-based Rails Applications book by Stephan Hagemann.

More information: https://cbra.info/

## Notes
### Chapter 3.3 / Page 74
It goes into asset loading for components and tries to add ZURB to Sportsball. I'm skipping working through this section for now since it looks like it'll be another rabbit hole. A great overview of the differences in Rails 6: https://prathamesh.tech/2019/08/26/understanding-webpacker-in-rails-6/

### Page 50
At the start of Chapter 3, the book says to regenerate the project from a script. There's considerable differences between this project and what gets generated due to using Rails 5 versus Rails 6. Notably:
- Using Request specs and converting Controller specs over - Rails and RSpec team to move towards testing away implementation details in Controllers. https://rspec.info/blog/2016/07/rspec-3-5-has-been-released/#rails-support-for-rails-5
- Dropping `rails-controller-testing` as a dependency - tl;dr it's provided as a way to support existing codebases with controller tests. It's not needed since we're using request specs. https://github.com/rspec/rspec-rails/issues/1393

### Page 39-40
Author makes argument for locking down dependencies with specific versions. This is done to ensure there's no drift between what's tested and what's in production.

Question: What happens if components have dependencies on the same gem, but of different versions. Does the component structure ensure there is no interference or namespace collision?.

### Page 31
I had no issue running `bin/rails db:drop db:create db:migrate` from the main app.

## Issues Encountered
### Page 68
When running `./build.sh` I ran into permission denied. This was because a node module has a `test.sh` file and the build script was trying to run it. To bypass this I've modified the `build.sh` file to ignore `./node_modules/` directory.

### Page 50, 60-63
I had trouble getting engine route/url helpers working in request specs, where they seemed to work in controller specs. Refer to https://github.com/rspec/rspec-rails/issues/2368 for more information.

### Page 46-47
After creating the prediction code and referencing the path helpers, we need to add it to `components/app_component/config/routes.rb`. Otherwise I see `undefined local variable or method `new_prediction_path'` when loading `localhost:3000`.

I've created an [errata ticket](https://github.com/shageman/component-based-rails-applications-book/issues/10) for it.

### Page 28
`ArgumentError: Trying to register Bundler::GemfileError for status code 4 but Bundler::GemfileError is already registered`

After generating game and team scaffolds, when trying to run `bin/rails db:migrate` in `components/app_component`, I ran into the above issue. This was an issue with [rubygems](https://github.com/rubygems/rubygems), updating your rubygems to the latest should fix it.

`gem update --system`

[Link to the Github issue](https://github.com/rubygems/rubygems/issues/3284) on rubygems repo.