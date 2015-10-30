FROM edib/base-dev:latest
MAINTAINER Christoph Grabo <edib@markentier.com>

RUN apk --update add \
    'erlang<18.2' \
    'erlang-asn1<18.2' \
    'erlang-common-test<18.2' \
    'erlang-compiler<18.2' \
    'erlang-cosevent<18.2' \
    'erlang-coseventdomain<18.2' \
    'erlang-cosfiletransfer<18.2' \
    'erlang-cosnotification<18.2' \
    'erlang-cosproperty<18.2' \
    'erlang-costime<18.2' \
    'erlang-costransaction<18.2' \
    'erlang-crypto<18.2' \
    'erlang-debugger<18.2' \
    'erlang-dev<18.2' \
    'erlang-dialyzer<18.2' \
    'erlang-diameter<18.2' \
    'erlang-edoc<18.2' \
    'erlang-eldap<18.2' \
    'erlang-erl-docgen<18.2' \
    'erlang-erl-interface<18.2' \
    'erlang-erts<18.2' \
    'erlang-et<18.2' \
    'erlang-eunit<18.2' \
    'erlang-gs<18.2' \
    'erlang-hipe<18.2' \
    'erlang-ic<18.2' \
    'erlang-inets<18.2' \
    'erlang-jinterface<18.2' \
    'erlang-kernel<18.2' \
    'erlang-megaco<18.2' \
    'erlang-mnesia<18.2' \
    'erlang-observer<18.2' \
    'erlang-odbc<18.2' \
    'erlang-orber<18.2' \
    'erlang-os-mon<18.2' \
    'erlang-ose<18.2' \
    'erlang-otp-mibs<18.2' \
    'erlang-parsetools<18.2' \
    'erlang-percept<18.2' \
    'erlang-public-key<18.2' \
    'erlang-reltool<18.2' \
    'erlang-runtime-tools<18.2' \
    'erlang-sasl<18.2' \
    'erlang-snmp<18.2' \
    'erlang-ssh<18.2' \
    'erlang-ssl<18.2' \
    'erlang-stdlib<18.2' \
    'erlang-syntax-tools<18.2' \
    'erlang-test-server<18.2' \
    'erlang-tools<18.2' \
    'erlang-typer<18.2' \
    'erlang-webtool<18.2' \
    'erlang-xmerl<18.2' && \
    rm -rf /var/cache/apk/*

RUN wget https://s3.amazonaws.com/rebar3/rebar3 -O /usr/local/bin/rebar3 && \
    chmod +x /usr/local/bin/rebar3 && \
    mkdir -p $HOME/.config/rebar3/ && \
    echo '{plugins, [rebar3_hex]}.' > $HOME/.config/rebar3/rebar.config && \
    rebar3 update && rebar3 plugins upgrade rebar3_hex
