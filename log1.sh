#!/bin/bash
prefdata=date '+%d%m%Y'
dirlog="/var/log/"
dirrotation="/var/rotation/"

  for name in find ${dirlog}
  do
  sed -r '/192.168.0.100/d; /127.0.0.1/d' ${dirlog}/access.log>${dirlog}/access2.log
  sed -r 's|([0-9]{2})([0-9]{2})([0-9]{4})|*****|g' ${dirlog}/access2.log>${dirlog}/access3.log
  sed -r 's|[A-Za-z0-9_]{1,3}+@domain.name|*****@domain.name|g' ${dirlog}/access3.log>${dirlog}/access4.log
  echo "done copying ${name} to ${dirrotation}${prefdata}"
  done

zip -r ${dirrotation}${prefdata}.zip ${dirlog}/access4.log
find ${dirrotation} -mmin +160 -delete
truncate -s 0 ${dirlog}/access.log
rm -f ${dirlog}/access2.log ${dirlog}/access3.log ${dirlog}/access4.log