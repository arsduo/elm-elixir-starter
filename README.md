[![CircleCI](https://circleci.com/gh/arsduo/elm-elixir-starter.svg?style=svg)](https://circleci.com/gh/arsduo/elm-elixir-starter)

# Elm+Elixir+OAuth Starter

Elm and Elixir have quickly become two of my favorite progamming languages, and together they've
made building new projects both at home and at work a lot of fun. There are good resources out
there on how to put those projects together, but as I've built more I've realized that a
fully working, ready-to-go starter project would save a ton of time.

## Features

* [Elixir 1.4.4](http://elixir-lang.org) for the backend, with [Phoenix 1.2.1](phoenixframework.org) configured for Postgres
* [Elm 0.18](http://elm-lang.org/) for the frontend
* Auth through Twitter (extendible to other OAuth providers through [Guardian](https://github.com/ueberauth/guardian)]/[Ueberauth](https://github.com/ueberauth/ueberauth))
* [Yarn](https://yarnpkg.com/) for deterministic Javascript package management
* SASS/SCSS support
* Elixir tests and linting via [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html) and [Credo](https://github.com/rrrene/credo)
* Elm compilation tests and linting via [elm-make](https://github.com/elm-lang/elm-make)
* Configured for CI testing and linting on [Circle CI](http://circleci.com)
* [Dockerized](https://www.docker.com/) for easy development and deployment

## Customizing this Repo

To set up a new project, just run `./setup_project.sh`. It'll ask you a few questions and make most
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

From the home page, you can auth with Twitter and will have access to the user info through the API:

<img width="600" alt="unauthed" src="https://cloud.githubusercontent.com/assets/48325/26558109/ea25f0a2-446b-11e7-820f-f5c165f4ac1c.png">
<img width="600" alt="twitter-auth" src="https://cloud.githubusercontent.com/assets/48325/26558108/ea239564-446b-11e7-8443-47218c4df29e.png">
<img width="600" alt="authed" src="https://cloud.githubusercontent.com/assets/48325/26558110/ea260f42-446b-11e7-85bb-ad2a7513b1a3.png">

## Contributing

Feedback is highly welcome! If you run into any problems, please [file an
issue](https://github.com/arsduo/elm-elixir-starter/issues/new) or, if you'd like, open a pull
request. I'm not an expert on Elm, Elixir, or Docker, so there may well be better ways to accomplish some of
what I've done -- if you see some, let me know!

Please note that this project is released with a Contributor Code of Conduct. By participating in
this project you agree to abide by its terms. See
[code_of_conduct.md](https://github.com/arsduo/elm-elixir-starter/blob/master/CODE_OF_CONDUCT.md) for more information.

## Thanks

Thanks to [Richard Whaling](https://github.com/rwhaling) for his invaluable help setting up Docker
and for his pairing on an earlier Elm+Elixir project, to [Gursimran
Singh](https://github.com/gnarmis) for his work at [eSpark Learning](http://esparklearning.com) on
Elixir and Docker, and, of course, the amazing people who've built all the technologies in this
repo.

Both welcome images were taken by me (Alex Koppel). One is of Dax, one of my cats, and the other an old door in Des Moines, IA, USA. You can probably use them if you want.

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
