# Chronic Between

A simple Ruby natural language parser for date and time ranges. (For example, Mon-Fri 09:00-16:30, etc.) Returns a boolean result. 

Several date and time ranges can be supplied with matching patterns being separated by a comma.

## Installation

    $ sudo gem sources -a http://gemcutter.org
    $ sudo gem install chronic_between

## Usage


    >> s = 'Mon-Fri 9:00-16:30, Saturday, Sunday'
    >> c = ChronicBetween.new(s)

    >> DateTime.now      
    => #<DateTime: 2011-03-26T16:54:40+00:00

    >> c.within? DateTime.now
    => true

    >> c.within? DateTime.parse("28-Mar-2011 14:33")
    => true

    >> c.within? DateTime.parse("28-Mar-2011 08:33")
    => false
    


Examples of parse-able strings:

* 'Mon-Fri 9:00-16:30'
* 'saturday' 
* '12:00-13:00'
* 'Sat,Sun'
* 'Mon-Fri 9:00-16:30, Saturday, Sunday'
* 'Mon-Fri 9:00-16:30, Saturday, 10:15-10:45'
* 'Sat 18:15-21:40'
* 'Mon-Wed'
* 'Mon-Fri 9:00 to 16:30'
* '9:00-16:30 Mon-Fri'
* '9:00 to 16:30 Mon-Fri'
* '3:45 to 5:15'
* 'Mon 3:45 to 5:15'
* '3:45-5:15 Mon'
* '3:45 to 5:15 Mon'
* 'after 6pm'
* 'before 9pm'
* 'April 2nd - April 5th 12:00-14:00'
* 'April 5th - April 9th'
* 'April 5th'
* 'not before 6pm'
* 'except after 6pm'
* 'Sunday, after 6pm'
* 'Saturday, not after 6pm'

