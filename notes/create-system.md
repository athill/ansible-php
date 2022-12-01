# Create a subsystem on Ubuntu

Reference: http://www.tldp.org/HOWTO/HighQuality-Apps-HOWTO/boot.html

## create file in /etc/init.d
```bash
	#!/bin/sh
	#
	# /etc/init.d/openproject
	# Subsystem file for "openproject" server
	#
	# chkconfig: 2345 95 05	(1)
	# description: openproject server daemon
	#
	# processname: openproject
	# pidfile: /var/run/openproject.pid

	# source function library
	. /etc/rc.d/init.d/functions

	# pull in sysconfig settings
	[ -f /etc/sysconfig/openproject ] && . /etc/sysconfig/openproject	(2)

	RETVAL=0
	prog="openproject"
	start() {
		echo -n $"Starting $prog:"
		RETVAL=$?
		[ "$RETVAL" = 0 ] && touch /var/lock/subsys/$prog
		echo
	}

	stop() {	(6)
		echo -n $"Stopping $prog:"
		killproc $prog -TERM
		RETVAL=$?
		[ "$RETVAL" = 0 ] && rm -f /var/lock/subsys/$prog
		echo
	}

	reload() {	(8)
		echo -n $"Reloading $prog:"
		killproc $prog -HUP
		RETVAL=$?
		echo
	}

	case "$1" in	(9)
		start)
			start
			;;
		stop)
			stop
			;;
		restart)
			stop
			start
			;;
		reload)
			reload
			;;
		condrestart)
			if [ -f /var/lock/subsys/$prog ] ; then
				stop
				# avoid race
				sleep 3
				start
			fi
			;;
		status)
			status $prog
			RETVAL=$?
			;;
		*)
			echo $"Usage: $0 {start|stop|restart|reload|condrestart|status}"
			RETVAL=1
	esac
	exit $RETVAL
```

## Add the subsystem via chkconfig
```bash
$ chkconfig --add openproject
```



