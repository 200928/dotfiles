#!/bin/bash
sensors | awk '/Package/{t=1}{if(t)s=length(s)?s$0:$0}/high/{t=0;if(s~/+*°C/)print s;s=""}' | awk -F '[+(]' '{ print $2}'
