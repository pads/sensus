[![Build Status](https://travis-ci.org/pads/sensus.png?branch=master)](https://travis-ci.org/pads/sensus)

# Sensus

Latin for *feeling*. A work-in-progress application to document your feelings
over time.

The principle functionality aims to provide the ability to track your
feelings over time and be able to look back at what you were feeling and why.

## Roadmap

* Edit individual feelings.
* Display a chart of mood over time.
* Allow other sign-up methods.
* Style for desktop.

## Contributing

Firstly, thank you!

### Prerequisites

* Rails 4+
* Postgres 9.3+

### Run

    bundle
    bundle exec rake db:setup
    bundle exec rake db:migrate
    bundle exec rails s

### Test

    bundle exec rake db:setup RAILS_ENV=test
    bundle exec rake db:migrate RAILS_ENV=test
    bundle exec rspec

To make tests run on source code changes, run guard first:

    guard
