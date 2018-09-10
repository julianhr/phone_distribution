# README

## System Requirements

- Ruby 2.5+
- Python 3.6+
- PostgreSQL 9+

## Installation

For the backend
```bash
gem install bundler
bundle install
rails db:create
rails db:migreate
rails db:seed
```

For the CLI:
```bash
pip install pipenv
cd cli/
pipenv install
```

**Note**: seeding will take about 15 minutes. It uses a file with real area code and zip code mappings, and mock phone numbers are generated in the process.

## Cloud Deployment

I deployed an instance of the Rails app to Heroku. It's located at https://phone-distribution.herokuapp.com.
The CLI included in the app points to this Heroku deployment. If you wish to run the backend locally, change the following:
```python
class NetworkingBase:
  def __init__(self):
    self.timeout = 3
    self.base_url = 'https://phone-distribution.herokuapp.com'
```
to `http://localhost:3000`.

## Localhost Execution

To run the API
```shell
bundle exec rails server
```

To run the Frontend CLI
```shell
cd /cli
python cli.py
```

## Test Coverage
The Rails application has 98.8% test coverage, per SimpleCov. I set up PyTest to write tests for the CLI but I couldn't dedicate much time to it.

To run the tests for Rails:
```bash
rspec
```

To run the tests for the CLI
```bash
cd cli/
pytest
```

## Supporting Documents
- The task I wrote that imports zip codes and cities and phone numbers was derived from the dataset downloaded from this site:
https://zipcodeo.com/download-zip-code-list

- The seed task is located at `/db/seeds.rb`

- Also, you can find an image that maps out the main backend model at `/etc/app_diagram.png`
