#!/bin/bash
LOWER=$(echo $1 | tr '[:upper:]' '[:lower:]')
DATE=$(date '+%Y-%m-%d')
NAME=$DATE-$LOWER.md
TITLE=$(echo $1 | sed 's/-/ /g');
echo "---" > $NAME
echo "title: \"$TITLE\"" >> $NAME
echo "created_at: $DATE" >> $NAME
echo "published_at: $DATE" >> $NAME
echo "kind: article" >> $NAME
echo "author: \"JTS\"" >> $NAME
echo "published: true" >> $NAME
echo "---" >> $NAME
