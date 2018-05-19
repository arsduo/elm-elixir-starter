[![CircleCI](https://circleci.com/gh/arsduo/elm-elixir-starter.svg?style=svg)](https://circleci.com/gh/arsduo/elm-elixir-starter)

# Elm+Elixir Starter Kit

Sometimes the most painful part of learning a new language isn't picking the new syntax or libraries or logic — it's figuring out all the supporting technologies. Wouldn't it be nice to jump straight to coding instead and pick up the infrastructure along the way?

Introducing the Elm+Elixir Starter Kit, a new **boilerplate project** combining **Elm** and **Elixir**, ready with an **easy, scripted setup** for developers who are excited to experiment and build with these languages.

## Features

* <a href="http://elixir-lang.org" target="_blank">Elixir 1.6.5</a> for the backend, with <a href="phoenixframework.org" target="_blank">Phoenix 1.2.1</a> configured for Postgres
* <a href="http://elm-lang.org/" target="_blank">Elm 0.18</a> for the frontend
* Authentication through Twitter (extensible to other providers through <a href="https://github.com/ueberauth/guardian" target="_blank">Guardian</a>/<a href="https://github.com/ueberauth/ueberauth" target="_blank">Ueberauth</a>)
* Independent frontend that communicates to the backend using JSON API calls
* Elixir tests and code linting/static analysis via <a href="https://hexdocs.pm/ex_unit/ExUnit.html" target="_blank">ExUnit</a> and <a href="https://github.com/rrrene/credo" target="_blank">Credo</a>
* Elm compilation tests and code listing via <a href="https://github.com/elm-lang/elm-make" target="_blank">elm-make</a>
* Ready for continuous integration on <a href="http://circleci.com" target="_blank">Circle CI</a>
* <a href="https://yarnpkg.com/" target="_blank">Yarn</a> for deterministic Javascript package management
* Configured for <a href="https://www.docker.com/" target="_blank">Docker</a> for easy development and deployment

## Getting Started

You can either fork the repo or clone directly from the original:

```bash
git clone git@github.com:arsduo/elm-elixir-starter.git
```

After that, just run `./setup_project.sh`. It'll ask you a few questions and make most
of the changes for you. Easy as pie!

<img width="600" alt="setup process screenshot" src="https://cloud.githubusercontent.com/assets/48325/26746960/62e7ec30-47b8-11e7-9348-2af3b1cbb464.png">

## Starting things up

Once you've customized the code, complete the setup with:

* `docker-compose build`
* `docker-compose run web mix ecto.create`

Commands you'll find useful on an ongoing basis:

* `docker-compose run web mix ecto.migrate`
* `docker-compose up`

And a few for code quality:

* Elixir tests: `mix test`
* Elixir linting: `mix credo`
* Elm linting: `yarn lint`

When the server is running, you'll see that Docker has built and compiled both the Elixir and the Elm code and is ready to go on [`localhost:4000`](http://localhost:4000):

<img width="600" alt="docker-compose" src="https://cloud.githubusercontent.com/assets/48325/26558107/ea230e28-446b-11e7-8210-a5258cb4f448.png">

For a guide to some of the interesting implementation details, check out the
[wiki](https://github.com/arsduo/elm-elixir-starter/wiki/How-It-Works).

## Deploying to Heroku

You can deploy apps derived from the Elm+Elixir starter to Heroku easily! Follow the steps for
creating a Heroku app:

* `heroku create`
* Add the buildpacks in `app.json` under settings
* `heroku addons:create heroku-postgresql:hobby-dev`
* Add appropriate config (environment) variables for the values required by `config/config.exs`
  (except the `PG_` values, that's covered by `DATABASE_URL`)
* Push it up and watch it deploy!



## Contributing

Feedback is highly welcome! If you run into any problems, please [file an
issue](https://github.com/arsduo/elm-elixir-starter/issues/new) or, if you'd like, open a pull
request. As a relative newbie to Elm, Elixir, _and_ Docker, I'm sure there are plenty of good
practices you know of that I've missed — thoughts, suggestions, and Github issues and especially
pull requests are very welcome!

Please note that this project is released with a Contributor Code of Conduct. By participating in
this project you agree to abide by its terms. See
[code_of_conduct.md](https://github.com/arsduo/elm-elixir-starter/blob/master/CODE_OF_CONDUCT.md) for more information.

## Thanks

Thanks to [Richard Whaling](https://github.com/rwhaling) for his invaluable help setting up Docker
and for his pairing on an earlier Elm+Elixir project, to [Gursimran
Singh](https://github.com/gnarmis) for his work at [eSpark Learning](http://esparklearning.com) on
Elixir and Docker, to [Corey Haines](https://github.com/coreyhaines) for an excellent introduction
to Elm, and, of course, the amazing people who've built all the technologies used in
this repo.

Both welcome images were taken by me (Alex Koppel). One is of Dax, one of my cats, and the other an old door in Des Moines, IA, USA.

## References

### Phoenix (backend)

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Phoenix [deployment guides](http://www.phoenixframework.org/docs/deployment).
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

### Elm (frontend)

[Elm](http://elm-lang.org/) has strong community guidelines for formatting code and a utility that can [automatically
format](https://github.com/avh4/elm-format) for you. Make sure to install appropriate editor
packages/formatters:

* vim: [elm-vim](https://github.com/ElmCast/elm-vim)
* Atom (not personally tested): [language](https://atom.io/packages/language-elm),
  [formatter](https://atom.io/packages/elm-format)
