# Hipster Album Cover generator

Uses several apis (currently wikipedia, flickr, and forismatic) to generate a 
hypothetical album cover for a hipster band

## Configuration

Dependencies and all configuration is done in <tt>environment.rb</tt>.

Add your controller actions in <tt>application.rb</tt>. Views for these actions
are placed in the <tt>views</tt> directory. Static files, including a stock
stylesheet, go in the <tt>public</tt> directory. Models go in the <tt>lib</tt>
directory and are auto-loaded (but that should change later).

Environment variables that you want to expose to your application can be added
in <tt>.env</tt> publicly, and <tt>.env.local</tt> for local secrets. You need a 
flickr api key from [here](http://www.flickr.com/services/apps/create/apply) to get images to work

## Testing

Add your specs in <tt>spec</tt>; just require <tt>spec_helper.rb</tt> to
pre-configure the test environment.
 To run the specs:

    bundle exec rake spec

## Getting Started

    bundle install
    bundle exec foreman start

## Extras

We've included a handy <tt>console</tt> script that fires up pry with your
environment loaded. To load it, use the Rake task:

    bundle exec rake console

## Todo

- refactor each of the random fetchers into their own classes
- extract string formatters and build a formatter 
  - for the band name the removes (parenthesis) and shortens in some cases
  - for the album title that is a bit smarter, or adjustable
- generate a permalink for each album that loads the same image and names
- improve styling
- provide links to sources
- make several different name/title overlay styles and pick at random, 
or by analyzing the image
- deploy to heroku
- hook up to soundcloud to actually play music
