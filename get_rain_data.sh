#!/bin/bash

REPO="http://repo.pscigrid.gov.ph/predict"
YEAR="2015"
MONTH="05"
DAY="12"

REPODIR=$REPO"/"$YEAR"/"$MONTH"/"$DAY"/"
for file in $(curl -s $REPODIR |
                  grep href |
                  sed 's/.*href="//' |
                  sed 's/".*//' |
                  grep '^[a-zA-Z].*'); do
    echo "Downloading "$REPODIR$file
    curl -s -O $REPODIR$file
done

