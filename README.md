# OpenBloodStocks

The aim of this project is to create a global API for fetching how much blood various blood donation authorities have at any one time. Most of these authorities collect information which they make available on their websites but they do not provide a public API.

## How does it work?

Each blood donation authority is scraped once daily and the information is placed in to an database with an API attached which anybody can use. This includes historical data as well as current data.

## My local blood donation authority isn't included!

Then add a scraper! (look in `lib/tasks/fetcher.rake`) I've started with the Welsh Blood Service as that is my local one. I'll move on to the rest of the UK and then hopefully worldwide in the future.

## API Docs

These are in progress. Sorry! URLs like this work though: http://openbloodstocks.herokuapp.com/records?authority=wales