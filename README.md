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

## Objective Checklist

- [x] Ability to enter a dictionary term, via form page
- [x] Ability to retrieve the corresponding definition for the term entered
- [x] Ability to maintain a list of the last 5 terms searched
- [x] Ability to handle exception errors, gracefully
- [x] Ability to log such exceptions to assist in troubleshooting

## New Objectives

- [x] Protect the params from the forms
- [x] Use a service object to handle out API calls
- [x] Try to DRY up the controller as much as possible, to keep the code readable
- [x] Allow for easy implementation of additional dictionaries
- [ ] Log exceptions in a better manner, they have been moved from the WordController. Will need to see how to get the logger working properly. Error handling is unaffected on client side.

## Contributing

Issues and pull requests are welcome at [https://github.com/rukshanuddin/final_frontend](https://github.com/rukshanuddin/final_frontend). This project as well as all other content on my GitHub are intended to be safe, welcoming, and open for collaboration.

Users are expected to adhere to the [Contributor Covenant code of conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct)

## Authors

**Rukshan Uddin** - *Initial work* - [GitHub/rukshanuddin](https://github.com/rukshanuddin) - [Personal Site](https://awesomeweb.design)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
