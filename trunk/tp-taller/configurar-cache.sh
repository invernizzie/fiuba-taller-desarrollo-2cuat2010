#! /bin/bash

chmod 777 cache
chmod 777 log

svn propset svn:ingnore "*" cache
svn propset svn:ingnore "*" log
