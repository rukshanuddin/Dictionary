# Dictionary

This is a simple dictionary using Ruby on Rails and the Oxford Dictionary API. You can access the application hosted [here](https://eerie-mummy-44381.herokuapp.com/).

## Installation

Installation is quick and easy. You will need to sign up for your set of API keys at [Oxford Dictionaries API](https://developer.oxforddictionaries.com/) developer's portal.

### Set up Rails app

First, install the gems required by the application:

```bash
bundle install
```

Next, execute the database migrations/schema setup:

```bash
rails db:setup
```

Then run the Rails server:

```bash
rails s
```

## Objectives

- [x] Ability to enter a dictionary term, via form page
- [x] Ability to retrieve the corresponding definition for the term entered
- [x] Ability to maintain a list of the last 5 terms searched
- [x] Ability to handle exception errors, gracefully
- [x] Ability to log such exceptions to assist in troubleshooting

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
