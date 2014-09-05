## Readme

An application to experiment with [DataTables](http://www.datatables.net/).

Demo Heroku app is [here](http://sandbox-012-data-tables.herokuapp.com/).

## Notes

* Remember that for css/scss to be compatible with Rails' asset pipeline, [links to assets](http://guides.rubyonrails.org/asset_pipeline.html#coding-links-to-assets) must use the -url and -path helpers:

  * `image-url("rails.png")` becomes `url(/assets/rails.png)`
  * `image-path("rails.png")` becomes `"/assets/rails.png"`

  For example, to support DataTable's sorting arrows, place the image files in app/assets/images, and use the following scss:

        table.dataTable thead .sorting { background: image-url('sort_both.png') no-repeat center right; }
        table.dataTable thead .sorting_asc { background: image-url('sort_asc.png') no-repeat center right; }
        table.dataTable thead .sorting_desc { background: image-url('sort_desc.png') no-repeat center right; }
        table.dataTable thead .sorting_asc_disabled { background: image-url('sort_asc_disabled.png') no-repeat center right; }
        table.dataTable thead .sorting_desc_disabled { background: image-url('sort_desc_disabled.png') no-repeat center right; }

* Remember that with TurboLinks, for JavaScript to load you should not use `$(document).ready`, but use:

        $(document).on "page:change", ->

## Getting Started with this codebase

1. Install gems:

        bundle install

2. Create the database:

        rake db:create

4. Migrate the database:

        rake db:migrate

5. Start the web server:

        rails server

5. Using a browser, go to [http://localhost:3000](http://localhost:3000)

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

