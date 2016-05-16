FROM edib/base-dev:latest
MAINTAINER Christoph Grabo <edib@markentier.com>

RUN apk --no-cache add \
    'erlang<19' \
    'erlang-asn1<19' \
    'erlang-common-test<19' \
    'erlang-compiler<19' \
    'erlang-cosevent<19' \
    'erlang-coseventdomain<19' \
    'erlang-cosfiletransfer<19' \
    'erlang-cosnotification<19' \
    'erlang-cosproperty<19' \
    'erlang-costime<19' \
    'erlang-costransaction<19' \
    'erlang-crypto<19' \
    'erlang-debugger<19' \
    'erlang-dev<19' \
    'erlang-dialyzer<19' \
    'erlang-diameter<19' \
    'erlang-edoc<19' \
    'erlang-eldap<19' \
    'erlang-erl-docgen<19' \
    'erlang-erl-interface<19' \
    'erlang-erts<19' \
    'erlang-et<19' \
    'erlang-eunit<19' \
    'erlang-gs<19' \
    'erlang-hipe<19' \
    'erlang-ic<19' \
    'erlang-inets<19' \
    'erlang-jinterface<19' \
    'erlang-kernel<19' \
    'erlang-megaco<19' \
    'erlang-mnesia<19' \
    'erlang-observer<19' \
    'erlang-odbc<19' \
    'erlang-orber<19' \
    'erlang-os-mon<19' \
    'erlang-ose<19' \
    'erlang-otp-mibs<19' \
    'erlang-parsetools<19' \
    'erlang-percept<19' \
    'erlang-public-key<19' \
    'erlang-reltool<19' \
    'erlang-runtime-tools<19' \
    'erlang-sasl<19' \
    'erlang-snmp<19' \
    'erlang-ssh<19' \
    'erlang-ssl<19' \
    'erlang-stdlib<19' \
    'erlang-syntax-tools<19' \
    'erlang-test-server<19' \
    'erlang-tools<19' \
    'erlang-typer<19' \
    'erlang-webtool<19' \
    'erlang-xmerl<19'

RUN curl -sSL https://github.com/erlang/rebar3/releases/download/3.1.0/rebar3 \
    -o /usr/local/bin/rebar3 && \
    chmod +x /usr/local/bin/rebar3 && \
    mkdir -p $HOME/.config/rebar3/ && \
    echo '{plugins, [rebar3_hex]}.' > $HOME/.config/rebar3/rebar.config && \
    rebar3 update && rebar3 plugins upgrade rebar3_hex
