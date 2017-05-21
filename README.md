# Elm+Elixir+OAuth Starter

Elm and Elixir have quickly become two of my favorite progamming languages, and together they've
made building new projects both at home and at work a lot of fun. There are good resources out
there on how to put those projects together, but as I've built more I've realized that a
fully working, ready-to-go starter project would save a ton of time.

In this repo, you'll find **an Elixir Phoenix web app** that uses **Elm as its frontend**, comes
with **Twitter OAuth support** (easily extensible to Facebook, etc.), and is **Dockerized** for
easy deployment.

I have at least two projects I'm excited to launch with this, and I hope this'll be useful to
you as well. (If it is, let me know! Feedback, pull requests, issues very welcome.)

Thanks to [Richard Whaling](https://github.com/rwhaling) for his invaluable help setting up Docker
and for his pairing on an earlier Elm+Elixir project.

## Starting things up

Once you've customized the code (see the next section), run:

* `docker-compose build`
* `docker-compose run web mix ecto.create`
* `docker-compose run web mix ecto.migrate`
* `docker-compose up`

Once it's up and running, `docker-compose run web mix ecto.migrate` and `docker-compose up` should
be all you need on an ongoing basis.

When the server is running, check out [`localhost:4000`](http://localhost:4000) -- it comes with a
login link that'll auth you with Twitter!

## Customizing this Repo

To set up a new project, you'll want to set up a few things:

### Choose a project name

* Replace `elmelixirstarter` with `yourprojectname` (case sensitive)
* Replace `Elmelixirstarter` with `Yourprojectname` (case sensitive)
* `mv lib/elmelixirstarter lib/${YOUR_PROJECT_NAME}`
* `mv lib/elmelixirstarter.ex lib/${YOUR_PROJECT_NAME}.ex`
* Change the project name in web/templates/layout/app.html.eex
* Change the database name in `docker-compose.yml`

### Set up credentials
* Set Twitter credentials appropriately in config/twitter.exs
* Set a Phoenix secret key in `config/config.exs`
* Set a Guardian secret key (for auth) in `config/config.exs`


## Known issues / to do

There are a few things that would make this more useful:

* There are a bunch of steps to customize the repo; the string replacement and file moving could probably be scripted.
* Elixir compiles each time you execute a `docker-compose run` command,/elm even though the Dockerfile includes `mix compile`.
* It doesn't start up with any cute images or instructions.

Overall, I'm not an expert on Docker setup, so there may well be better ways to accomplish some of
what I've done -- if you see some, let me know!

## Phoenix (backend)

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Phoenix [deployment guides](http://www.phoenixframework.org/docs/deployment).
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
