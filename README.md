## Readme

An application to experiment with [DataTables](http://www.datatables.net/).

Demo Heroku app is [here](http://sandbox-012-data-tables.herokuapp.com/).

See the excellent RailsCast [here](http://railscasts.com/episodes/340-datatables).

## Notes

* Use [jquery-datatables-rails](https://github.com/rweng/jquery-datatables-rails) gem. This takes care of smoothly getting the css, js, and images into the pipeline.

* Create a dedicated datatables/products_datatable.rb class to handle the serving of json in a datatable friendly way.

* Remember that with TurboLinks, for JavaScript to load you should not use `$(document).ready`, but use:

        $(document).on "page:change", ->

## Getting Started with this codebase

1. Install gems:

        bundle install

2. Create the database:

        rake db:create

4. Migrate the database:

        rake db:migrate

5. Create seed data:

        rake db:seed

6. Start the web server:

        rails server

7. Using a browser, go to [http://localhost:3000](http://localhost:3000)

## Running the test suite

        rake

## Deploying to Heroku

1. Install the [Heroku toolbelt](https://devcenter.heroku.com/articles/getting-started-with-rails4#local-workstation-setup) on local workstation (if not already installed).

2. Create the [Heroku app](https://devcenter.heroku.com/articles/getting-started-with-rails4#deploy-your-application-to-heroku) (if not already created).

        heroku apps:create

3. [Deploy](https://devcenter.heroku.com/articles/git#deploying-code)

        git push heroku master

4. Run migrations

        heroku run rake db:migrate

5. Visit the deployed app

        heroku open

