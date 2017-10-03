# youtube_dlhelper 3.0.0

1. [Introduction](#introduction)
1. [Contributing](#contributing)
1. [Building](#building)
1. [Communication](#communication)
1. [Problem reporting](#problem-reporting)
1. [Thanks](#thanks)

| What                          | Status                                                                                                                                                                              |
|-------------------------------|-----------------------------------------------|
| license                       | GPL3                                          |
| authors blog                  | http://saigkill.tuxfamily.org                 |
| openhub statistics            | https://www.openhub.net/p/youtube_dlhelper    |


## Introduction
The youtube_dlhelper is a short tool for download and manage the downloaded files.
You are running the program inside the command line with a Youtube URL. Then it
asks for a group name or interpreters name. Now it creates a Subfolder inside
your Musicdirectory. Then it makes a MP3 from the downloaded file and moves it
to the folder.

The CHANGELOG contains a detailed description on what has changed. For most
users the NEWS file might be a better place to look since it contains
change summaries between the different versions.

youtube_dlhelper is released under the GNU General Public License (GPL) version 3+,
see the file 'COPYING' for more information.

The official web site is:

    https://launchpad.net/youtube-dlhelper

## Synopsis

    $ youtube_dlhelper YoutubeURL

    Example:
    youtube_dlhelper http://www.youtube.com/watch?v=aHjpOzsQ9YI
    If a https:// URL doesn't work use http:// instead

Read the documentation at: https://saigkill.tuxfamily.org/docs/youtube_dlhelper/en-US/html/

## Contributing

### Ideas
  
* If have some good ideas for stuff that you want to see in this program you
should check the TODO file first before sending email.

### Cool hacks

* Open a bugreport on https://bugs.launchpad.net/youtube-dlhelper.
* Please use the -u flag when generating the patch as it makes the patch
  more readable.
* Write a good explanation of what the patch does.
* It is better to use git format-patch command: git format-patch HEAD^

### Contributor Code of Conduct

As contributors and maintainers of this project, we pledge to respect all 
people who contribute through reporting issues, posting feature requests, 
updating documentation, submitting pull requests or patches, and other 
activities.

We are committed to making participation in this project a harassment-free 
experience for everyone, regardless of level of experience, gender, gender 
identity and expression, sexual orientation, disability, personal 
appearance, body size, race, age, or religion.

Examples of unacceptable behavior by participants include the use of sexual 
language or imagery, derogatory comments or personal attacks, trolling, 
public or private harassment, insults, or other unprofessional conduct.

Project maintainers have the right and responsibility to remove, edit, or 
reject comments, commits, code, wiki edits, issues, and other contributions 
that are not aligned to this Code of Conduct. Project maintainers who do 
not follow the Code of Conduct may be removed from the project team.

Instances of abusive, harassing, or otherwise unacceptable behavior may be 
reported by opening an issue or contacting one or more of the project 
maintainers.

This Code of Conduct is adapted from the [Contributor Covenant](http:contributor-covenant.org), 
version 1.0.0, available at [http://contributor-covenant.org/version/1/0/0/](http://contributor-covenant.org/version/1/0/0/)

### Maintanance Policy

I'm following the Semantic Versioning for its releases: (Major).(Minor).(Patch).

 * Major version: Whenever there is something significant or any backwards
   incompatible changes.
 * Minor version: When new, backwards compatible functionality is introduced a
   minor feature is introduced, or when a set of smaller features is rolled out.
 * Patch number: When backwards compatible bug fixes are introduced that fix
   incorrect behavior.
 * The current stable release will receive security patches and bug fixes
   (eg. 5.0 -> 5.0.1).
 * Feature releases will mark the next supported stable release where the minor
   version is increased numerically by increments of one (eg. 5.0 -> 5.1).

I encourage everyone to run the latest stable release to ensure that you can
easily upgrade to the most secure and feature rich experience. In order to
make sure you can easily run the most recent stable release, we are working
hard to keep the update process simple and reliable.

### Structure
#### Branches

##### `trunk` branch
The trunk branch is the current edge of development.

##### `X.X` branch
The X.X branch is the last stable branch. It will used for tarballs.

#### Merge requests
If you want to merge your branch with the trunk, click on
"Propose for merging" on Launchpad.

Please base all Merge requests off the `trunk` branch. Merges to
`X.X` only occur through the `trunk` branch.

## Requirements (Rubygems)

* nokogiri
* setup
* highline
* parseconfig
* youtube-dl.rb
* steamio-ffmpeg
* rainbow
* addressable
* notifier

## Building (Just for the Maintainer)

youtube_dlhelper requires:
 
* xsltproc (for the manpage)
* ruby 2.2.3 (Min)
* itstool

### Simple install procedure:

The installation is very easy.

    gem install youtube_dlhelper
    cd /path/to/gem (In case of using RVM ~/.rvm/gems/ruby-2.2.1/gems/youtube_dlhelper)
    rake setup

Read the documentation at: https://saigkill.tuxfamily.org/docs/youtube_dlhelper/en-US/html/

You have to run the setup after each gem update.

## Communication

Join the team on: https://launchpad.net/~youtube-dlhelper.

## Problem Reporting

Bugs should be reported to https://bugs.launchpad.net/youtube-dlhelper. You will need to create an
account for yourself.

See https://bugs.launchpad.net/youtube-dlhelper is your problem is already reported.


