# Elm+Elixir Starter

Elm and Elixir are languages I've been using more and more; to make it easier to spin up new
projects, this repo puts together a starter codebase that can be used to kick off a new project.

Thanks to [Richard Whaling](https://github.com/rwhaling) for his pairing on the original project
that this is drawn from.

## Customizing this Repo

To set up a new project:

* Replace `elmelixirstarter` with `yourprojectname` (case sensitive)
* Replace `Elmelixirstarter` with `Yourprojectname` (case sensitive)
* Set a Phoenix secret key in `config/config.exs`
* Set a Guardian secret key (for auth) in `config/config.exs`
* Set your database appropriately in `dev.exs`, etc.
* Set Twitter credentials appropriately in config/twitter.exs
* `mv lib/elmelixirstarter lib/${YOUR_PROJECT_NAME}`
* `mv lib/elmelixirstarter.ex lib/${YOUR_PROJECT_NAME}.ex`
* Change the project name in web/templates/layout/app.html.eex

Then follow the steps for the backend below and you should be good to go!

## Phoenix (backend)

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

### Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Elm (frontend)


### Formatting

Elm has strong community guidelines for formatting code and a utility that can [automatically
format](https://github.com/avh4/elm-format) for you. Make sure to install appropriate editor
packages/formatters:

* vim: [elm-vim](https://github.com/ElmCast/elm-vim)
* Atom (not personally tested): [language](https://atom.io/packages/language-elm),
  [formatter](https://atom.io/packages/elm-format)

### Learn more

  * Official website: http://elm-lang.org/
