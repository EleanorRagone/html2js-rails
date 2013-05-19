# html2js-rails
html2js, but for rails.  Converts AngularJS templates to JS to store in cache, clientside.

## Setup:
*  create an initializer: 

```ruby
# config/html2js.rb
Html2js.configure do |config|
      config.root = "#{Rails.root}/app/assets/templates"
end
```

*  Add the templates to the javascript manifest file:

```javascript
// app/assets/javascripts/application.js
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
// require_tree .
//= require angular
//= require angular-resource
//= require_tree ../templates
//= require_tree ./angular
```

*  Place your templates in `app/assets/templates`, and make sure they end in `.js.tpl.haml`.  That's what I use,
that's what I know works.  It *should* work with just `.js.tpl`, but I haven't tried it.  It should equally work
with, ERB, for example, but I haven't tried that either.


## Contributing
Please feel free to fork, commit and send a pull request - or even just open an issue with recommendations for what you'd like to see improved!
