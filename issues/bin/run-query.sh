#!/bin/bash
dir=$(dirname $0);
query=$1
ssh www1.drupal.org ~/bin/drush -l http://drupal.org/ -r /var/www/drupal.org/htdocs sql cli < queries/$query.mysql 2> /dev/null | pv -N $query | $dir/tsv-to-json.php > results/$query.json
