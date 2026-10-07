#!/bin/sh

rm -rf dist

# build the themes from the template using rose pine bloom
bloom build manifest.template.json --output dist --format hex

pack() {
    local theme="${1:-}"

    mkdir -p dist/rose-pine"$theme"

    mv dist/rose-pine"$theme".json dist/rose-pine"$theme"/manifest.json
    cp icons/rose-pine"$theme".png dist/rose-pine"$theme"/icon.png

    zip -j dist/zip/rose-pine"$theme".zip dist/rose-pine"$theme"/*
}

mkdir -p dist/zip

pack;
pack "-moon"
pack "-dawn"
