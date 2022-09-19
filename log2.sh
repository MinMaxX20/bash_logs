#!/bin/bash

curdata=date '+%d%m%Y' -d "yesterday"
dirlog="/var/log/"
dirrotation="/var/rotation1/"
logs1="/var/log/chunga.log" 
logs2="/var/log/custom.log" 
logs3="/var/log/error.log" 
logs4="/var/log/seo.log"

logs11="/var/log/chunga4.log" 
logs22="/var/log/custom4.log" 
logs33="/var/log/error4.log" 
logs44="/var/log/seo4.log"

  for name in find ${dirlog}
  do
  sed -r '/192.168.0.100/d; /127.0.0.1/d' ${logs1}>${dirlog}/chunga2.log
  sed -r '/192.168.0.100/d; /127.0.0.1/d' ${logs2}>${dirlog}/custom2.log
  sed -r '/192.168.0.100/d; /127.0.0.1/d' ${logs3}>${dirlog}/error2.log
  sed -r '/192.168.0.100/d; /127.0.0.1/d' ${logs4}>${dirlog}/seo2.log
  sed -r 's|([0-9]{2})([0-9]{2})([0-9]{4})|*****|g' ${dirlog}/chunga2.log>${dirlog}/chunga3.log
  sed -r 's|([0-9]{2})([0-9]{2})([0-9]{4})|*****|g' ${dirlog}/custom2.log>${dirlog}/custom3.log
  sed -r 's|([0-9]{2})([0-9]{2})([0-9]{4})|*****|g' ${dirlog}/error2.log>${dirlog}/error3.log
  sed -r 's|([0-9]{2})([0-9]{2})([0-9]{4})|*****|g' ${dirlog}/seo2.log>${dirlog}/seo3.log
  sed -r 's|[A-Za-z0-9_]{1,3}+@domain.name|*****@domain.name|g' ${dirlog}/chunga3.log>${dirlog}/chunga4.log
  sed -r 's|[A-Za-z0-9_]{1,3}+@domain.name|*****@domain.name|g' ${dirlog}/custom3.log>${dirlog}/custom4.log
  sed -r 's|[A-Za-z0-9_]{1,3}+@domain.name|*****@domain.name|g' ${dirlog}/error3.log>${dirlog}/error4.log
  sed -r 's|[A-Za-z0-9_]{1,3}+@domain.name|*****@domain.name|g' ${dirlog}/seo3.log>${dirlog}/seo4.log
  echo "done copying ${name} to ${dirrotation}${curdata}"
  done

zip -r ${dirrotation}${curdata}.zip ${logs11} ${logs22} ${logs33} ${logs44} 
find ${dirrotation} -mtime +10 -delete
truncate -s 0 ${logs1} ${logs2} ${logs3} ${logs4} 
rm -f ${logs11} ${logs22} ${logs33} ${logs44}
rm -f ${dirlog}/chunga2.log ${dirlog}/chunga3.log
rm -f ${dirlog}/custom2.log ${dirlog}/custom3.log
rm -f ${dirlog}/error2.log ${dirlog}/error3.log
rm -f ${dirlog}/seo2.log ${dirlog}/seo3.log