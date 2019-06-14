FROM elixir:1.8.2-otp-22-alpine
LABEL maintainer="Jackson"

RUN apk update && apk add inotify-tools && apk add nodejs

WORKDIR /app

COPY mix* ./
RUN mix local.hex --force && mix local.rebar --force \
    && mix deps.get && mix deps.compile

COPY . .

EXPOSE 4000

CMD ["mix", "phoenix.server"]