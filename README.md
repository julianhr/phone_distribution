# README

## System Requirements

- Ruby 2.5+
- Python 3.6+
- PostgreSQL 9+

## Installation

To run the backend
```bash
gem install bundler
bundle install
rails db:create
rails db:migreate
rails db:seed
```
**Note**: seeding will take about 15 minutes. It uses a file with real area code and zip code mappings, and mock phone numbers are generated in the process.

## Execution

To run the API
```shell
bundle exec rails server
```

To run the Frontend CLI
```shell
cd /cli
python cli.py
```
