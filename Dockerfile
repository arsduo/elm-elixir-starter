FROM elixir:1.6.5-slim

# Compile app
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# Install HTTPS support for apt-get and other necessary utilities not included in the slim slim base image:
# curl (for installing stuff), git (for mix deps.get), and make (for the Elixir OAuth package), inotify-tools (for live reloading in dev)
RUN apt-get update && apt-get install -y apt-transport-https curl git make inotify-tools gnupg g++

# Install the Javascript dependencies
# We have to explicitly set up the system to install Node 7; by default it's 0.10, oddly
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
      && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
      && curl -sL https://deb.nodesource.com/setup_8.x | bash \
      && apt-get install -y nodejs yarn
ADD package.json .
ADD yarn.lock .
# Phoenix dependencies required for yarn to run
ADD deps ./deps
RUN yarn install

ADD ./elm/elm-package.json ./elm/elm-package.json
WORKDIR /usr/src/app/elm
RUN yarn global add elm \
      && elm-package install -y
WORKDIR /usr/src/app

# Install Elixir Deps
ADD mix.* ./
RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix hex.info
RUN mix deps.get

# Install app
ADD . .
RUN mix compile

# Install all Elm dependencies
RUN cd elm && elm-package install --yes

# Exposes this port from the docker container to the host machine
EXPOSE 4000

CMD mix phoenix.server
