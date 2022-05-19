# Shortay

#### The Freshest URL shortener on the internet.

This application service allows users to create bookmarks with shortened URLs.  Users can request the shortened URLs and will be redirected to the original URL.  This application provides a basic web UX and a backend API service which allows clients to:

- Create a shortened URL from a longer URL. 
- Specify a custom slug. 
- Expire or delete a previous URL.
- Open the URL and get redirected.

This project includes an automated test suite, which can be run in several ways.  

 - When the developer pushes to the `development` or `main` branches
 - When the a pull request is initiated on the `development` or `main` branches
 - By running `bundle exec rspec` from within the root directory of the application code. 
 - By initiating Guard to watch local files for changes and run the associated spec `bundle exec guard`


### Local Development Requirements 

 - Ruby 3.0+
 - Rails 7.0+
 - Postgresql 
 - 'pg' gem

### Getting Started 

- Download or clone the repo
- Run `bundle install` and `rails db:setup`
- Run the Test Suite with `bundle exec rspec` 
- Use autotesting while you develop with `bundle exec guard`
