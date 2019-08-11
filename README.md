# pflogsumm

A dead simple image to use pflogsumm in your docker environment. :-)

# Dependencies to add
* Docker
* Postfix with logging to volume enabled
* A cup of the best coffee you can find and 30 mins ;-)
** 10 min for setup
** 20 min coffee time

# Quckstart
This repo is available as builded image at hub.docker.com:

To use this image simply run the following command:

<code>docker run --rm --name pflogsumm --volume mailserver_log:/maillog:ro codeadmin/pflogsumm</code>

You'll get a summary for today as output to your terminal.

The container will assume the postfix log in <code>/maillog/mail.log</code>. 
This should cover most configurations, because the default name for mail activity logs is <code>mail.log</code>

# Usage
The default values are <code>-d today /maillog/mail.log</code>.
This will generate a report for today and pflogsumm will find the log at /maillog/mail.log.
This command runs when you start the container without additional parameters.

Perhaps you want to get a report and the log file is called "mymail.log"? No Problem - just add it like this:
<code>-d today /maillog/mymail.log</code>

The complete command could be: <code>docker run --rm --name pflogsumm --volume mailserver_log:/maillog:ro codeadmin/pflogsumm -d today /maillog/mymail.log</code>

Feel free to start the container with some other options. It's your choice.

# Docker Volume
<code>maillog:ro</code>: Mount the volume of your mailserver log dir into this location. 
This container doesn't need write privileges, so it's save to mount it read-only (<code>:ro</code>).

# Credits
A big thankyou goes out to James S. Seymour, developer of pflogsumm (https://jimsun.linxnet.com/postfix_contrib.html)

# License
    pflogsumm Docker Image
    Copyright (C) 2019  Frederic Habich <frederic.habich@codeadmin.de>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see https://www.gnu.org/licenses/.