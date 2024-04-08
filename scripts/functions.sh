#!/usr/bin/env bash

getCurrentVersion() {
  awk -F '"' '/"version":/ {print $4}' elm.json | head --lines=1
}
