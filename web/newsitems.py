# -*- encoding: utf-8
# Setup code, stay away
items = []
item = lambda *x: items.append(x)

# News items go here, most recent ones at top. Dates can be either
# strings or time(3) output.
#
# item("INSERT TITLE HERE",
#      (1901, 3, 1),
#      """
#      INSERT TEXT HERE
#      """,
#      "INSERT AUTHOR HERE")

# http://news.gmane.org/gmane.comp.gnome.gtk%2B.python/

item("""Glade 3.20.0 released""", (2016, 3, 22),
     """
    <p>Glade 3.20.0 is now available for download.</p>
    <p>Glade 3.20.0 is the new stable release for GNOME 3.20.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade User Survey results""", (2016, 2, 8),
     """<p>Preliminary results are available in my <a href="https://blogs.gnome.org/xjuan/2016/02/08/developer-experience-hackfest-2016/">blog</a></p>""",
     'Juan Pablo Ugarte')

item("""Glade 3.19.0 released""", (2015, 6, 11),
     """
    <p>Glade 3.19.0 is now available for download.</p>
    <p>Glade 3.19.0 is the first development release in the series.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2015-June/002090.html">3.19.0 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.18.3 released""", (2014, 4, 14),
     """
    <p>Glade 3.18.3 is now available for download.</p>
    <p>Glade 3.18.3 is the third bug fix release in the series.</p>
    <p>See <a href="http://lists.ximian.com/pipermail/glade-devel/2014-May/002062.html">3.18.3 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.8.5 released""", (2014, 5, 12),
     """
    <p>Glade 3.8.5 is now available for download.</p>
    <p>It is the fifth bug fix release in the series.</p>
    <p>See <a href="http://lists.ximian.com/pipermail/glade-devel/2014-May/002063.html">3.8.5 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.18.2 released""", (2014, 4, 14),
     """
    <p>Glade 3.18.2 is now available for download.</p>
    <p>Glade 3.18.2 is the second bug fix release in the series.</p>
    <p>See <a href="http://lists.ximian.com/pipermail/glade-users/2014-April/005736.html">3.18.2 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.18.1 released""", (2014, 3, 26),
     """
    <p>Glade 3.18.1 is now available for download.</p>
    <p>Glade 3.18.1 is the first bug fix release in the series.</p>
    <p>See <a href="http://lists.ximian.com/pipermail/glade-users/2014-March/005729.html">3.18.1 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.18.0 released""", (2014, 3, 24),
     """
    <p>Glade 3.18.0 is now available for download.</p>
    <p>Glade 3.18.0 is the new stable release for GNOME 3.12.</p>
    <p>See <a href="http://lists.ximian.com/pipermail/glade-users/2014-March/005727.html">3.18.0 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.16.1 released""", (2013, 12, 18),
     """
    <p>Glade 3.16.1 is now available for download.</p>
    <p>Glade 3.16.1 is the first bug fix release in the series.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2013-December/002042.html">3.16.1 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.14.3 released""", (2013, 11, 27),
     """
    <p>Glade 3.14.3 is now available for download.</p>
    <p>This release is meant for distributions that are not shipping the current stable release
(version 3.16) and have a version of glib >= 2.37 which exposed a bug in Glade.</p>
    <a href="http://lists.ximian.com/pipermail/glade-devel/2013-November/002041.html">3.14.3 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade User Survey goes live""", (2013, 11, 18),
     """
    <p>We are conducting a survey to better know our user base</p>
    <p>So please take a few minutes to <a href="registration.html">complete it</a> we appreciate it.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.16.0 released""", (2013, 9, 24),
     """
    <p>Glade 3.16.0 is now available for download.</p>
    <p>Glade 3.16.0 is the latest stable release.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2013-September/002030.html">3.16.0 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.8.4 released""", (2013, 9, 19),
     """
    <p>Glade 3.8.4 is now available for download.</p>
    <p>It is the fourth bug fix release in the series.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2013-September/002028.html">3.8.4 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.15.0 released""", (2013, 3, 06),
     """
    <p>Glade 3.15.0 is now available for download.</p>
    <p>Glade 3.15.0 is the first development release in the series.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2013-March/002006.html">3.15.0 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.8.3 released""", (2012, 12, 03),
     """
    <p>Glade 3.8.3 is now available for download.</p>
    <p>It is the third bug fix release in the series.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2012-December/002005.html">3.8.3 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.14.2 released""", (2012, 11, 26),
     """
    <p>Glade 3.14.2 is now available for download.</p>
    <p>Glade 3.14.2 is the second bug fix release in the series.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2012-November/002004.html">3.14.2 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.14.1 released""", (2012, 10, 14),
     """
    <p>Glade 3.14.1 is now available for download.</p>
    <p>Glade 3.14.1 aka New York City Release, is the first bug fix release in the series.
It features an important bug fix where some properties in GtkButton where not editable.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2012-October/001998.html">3.14.1 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.14 released""", (2012, 9, 19),
     """
    <p>Glade 3.14.0 is now available for download.</p>
    <p>Glade 3.14.0 is the first release in the new stable series.
It has a new UI implementation made with glade itself! and new features like a preference dialog and notify detail support.
It also brings back to life GtkAssistant support and adds style classes support.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2012-September/001987.html">3.14.0 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.10.3 and 3.12.2 released""", (2012, 9, 19),
     """
    <p>Glade 3.10.3 and 3.12.2 are now available for download.</p>
    <p>Glade 3.10.3 and 3.12.2 are bugfix release of the old stable series.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2012-September/001989.html">3.10.3 release notes</a> and the <a href="http://lists.ximian.com/pipermail/glade-devel/2012-September/001986.html">3.12.2 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.12.1 and 3.13.0 released""", (2012, 04, 6),
     """
    <p>Glade 3.12.1 and 3.13.0 are now available for download.</p>
    <p>Glade 3.12.1 is the first bugfix release of the stable series, and 3.13.0 is a new development release.
The new developmet resease sports a new UI implementation made with glade itself! and new features like a preference dialog and notify detail support.</p>
    <p> <a href="http://lists.ximian.com/pipermail/glade-devel/2012-May/001981.html">3.12.1 release notes</a> and the <a href="http://lists.ximian.com/pipermail/glade-devel/2012-May/001982.html">3.13.0 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')


item("""Glade 3.12.0 and 3.8.2 released""", (2012, 03, 26),
     """
    <p>Glade 3.12.0 and 3.8.2 are now available for download.</p>
    <p>Glade 3.12.0 is the first stable release of the new series, and 3.8.2 is another bugfix release.
It includes support for new widgets like GtkSwitch and GtkInfoBar and also
features new workspace edit modes which let you change widget margins and alignment
properties using nothing but the mouse!</p>
    <p>See the <a href="http://lists.ximian.com/pipermail/glade-devel/2012-March/001967.html">3.12.0 release notes</a> and the <a href="http://lists.ximian.com/pipermail/glade-devel/2012-March/001966.html">3.8.2 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')


item("""Glade 3.11.0 released""", (2012, 02, 12),
     """
    <p>Glade 3.11.0 is now available for download.</p>
    <p>Glade 3.11.0 is the first release of the new development series.
It includes support for new widgets like GtkSwitch and GtkInfoBar and also
features new workspace edit modes which let you change widget margins and alignment
properties using nothing but the mouse!</p>
    <p>See the <a href="http://lists.ximian.com/pipermail/glade-devel/2012-February/001952.html">3.11.0 release notes</a> for more details.</p>
     """, 'Juan Pablo Ugarte')

item("""Glade 3.8.1 and 3.10.2 released""", (2011, 10, 11),
     """
    <p>Glade 3.8.1 and 3.10.2 are now available for download.</p>
    <p>These are bugfix releases for the 3.8 series for GTK+-2 and the 3.10 series for GTK+-3</p>
    <p>See the <a href="http://lists.ximian.com/pipermail/glade-devel/2011-October/001910.html">3.8.1 release notes</a> and the <a href="http://lists.ximian.com/pipermail/glade-devel/2011-October/001915.html">3.10.2 release notes</a> for more details.</p>
     """, 'Tristan Van Berkom')

item("""Glade 3.8.0 and 3.10.0 released""", (2011, 4, 5),
     """
    <p>Glade 3.8.0 and 3.10.0 are now available for download.</p>
    <p>3.8 is the last stable series of Glade for GTK+2 and 3.10 is the first stable series for GTK+3</p>
    <p>Major changes in 3.10 compared to past stable releases:</p>
    <ul>
    <li>ABI stability for plugins and IDE embedders.</li>
    <li>Improved workspace experience.</li>
    <li>New preview feature.</li>
    <li>All widgets now have icons.</li>
    <li>Almost every GTK+ widget has support in Glade (still missing GtkSwitch/GtkInfoBar).</li>
    </ul>
    <p>See the <a href="http://lists.ximian.com/pipermail/glade-devel/2011-April/001891.html">full announcement</a> for more details.</p>
     """, 'Tristan Van Berkom')

item("""Glade 3.9.2 released""", (2011, 2, 1),
     """
    <p>Glade 3.9.2 is now available for download.</p>
    <p>This is the third GTK+ 3.0 compatible release leading up to 3.10.</p>
    <p>Some highlights in this release:</p>
    <ul>
    <li>Project widgets are rendered off screen, nicer selection drawing.</li>
    <li>All project widgets show up in the same workspace.</li>
    <li>Added support for GtkComboBoxText, GtkFileFilter and GtkRecentFilter.</li>
    </ul>
    <p>See the <a href="http://lists.ximian.com/pipermail/glade-devel/2011-February/001881.html">full announcement</a> and <a href="http://blogs.gnome.org/tvb/2011/02/01/glade-learns-some-new-tricks/">blog post</a> for more details.</p>
     """, 'Tristan Van Berkom')

item("""Glade 3.9.1 released""", (2011, 1, 13),
     """
    <p>Glade 3.9.1 is now available for download.</p>
    <p>This is the second GTK+ 3.0 compatible release leading up to 3.10.</p>
    <p>Some highlights in this release:</p>
    <ul>
    <li>Signal Editor now supports Drag'n'Drop of signals into IDE's like Anjuta.</li>
    <li>Custom Editor to edit GtkTextTagTable.</li>
    <li>Custom Editor to edit GtkToolPalette and its groups/items.</li>
    </ul>
    <p>See the <a href="http://lists.ximian.com/pipermail/glade-devel/2011-January/001864.html">full announcement</a> for more details.</p>
     """, 'Tristan Van Berkom')

item("""Glade 3.9.0 released""", (2011, 1, 6),
     """
    <p>Glade 3.9.0 is now available for download.</p>
    <p>This is the first GTK+ 3.0 compatible release leading up to 3.10.</p>
    <p>Some highlights in this release:</p>
    <ul>
    <li>New Preview feature available.</li>
    <li>Custom Editor to edit GtkActionGroup.</li>
    <li>Progress bars in the notebook tabs while projects are loading.</li>
    <li>Optimizations: object selection time and project switching time is greatly improved.</li>
    <li>The core library for 3.10 onward will be ABI stable.</li>
    </ul>
    <p>See the <a href="http://lists.ximian.com/pipermail/glade-devel/2011-January/001858.html">full announcement</a> for more details.</p>
     """, 'Tristan Van Berkom')

item("""Glade 3.7.3 released""", (2011, 1, 6),
     """
    <p>Glade 3.7.3 is now available for download.</p>
    <p>Some highlights in this release:</p>
    <ul>
    <li>New Preview feature available.</li>
    <li>Custom Editor to edit GtkActionGroup.</li>
    <li>Support for loading GtkOptionMenu.</li>
    <li>Progress bars in the notebook tabs while projects are loading.</li>
    <li>Stability, stability and more stability.</li>
    </ul>
    <p>See the <a href="http://lists.ximian.com/pipermail/glade-devel/2011-January/001859.html">full announcement</a> for more details.</p>
     """, 'Tristan Van Berkom')


item("""Glade 3.7.1 released""", (2010, 5, 14),
     """
    <p>An exciting start to the 3.7 series is released.</p>
    <p>Some highlights in this release:</p>
    <ul>
    <li>No more Horizontal VBoxes</li>
    <li>Added notebook tabs to navigate through projects.</li>
    <li>Option to hide toolbar/statusbar.</li>
    <li>Now Glade uses GtkToolPalette for its palette.</li>
    <li>Signal Editor greatly improved</li>
    </ul>
    <p>See the <a href="http://mail.gnome.org/archives/gnome-announce-list/2010-May/msg00025.html">full announcement</a> for more details.</p>
     """, 'Tristan Van Berkom')

item("""Glade 3.7.0 released""", (2010, 3, 10),
     """See the <a href="http://mail.gnome.org/archives/gnome-announce-list/2010-March/msg00030.html">full announcement</a> for details.""", 'Tristan Van Berkom')

item("New website design", (2009, 7, 20),
     """Our website gets a facelift. Enjoy!.""", 'Javier Jardón')

item("""Glade 3.6.7 "Horizontally Oriented" released""", (2009, 6, 29),
     """See the <a href="http://mail.gnome.org/archives/gnome-announce-list/2009-June/msg00063.html">full announcement</a> for details.""", 'Tristan Van Berkom')

item("Glade 3.6.0 released", (2009, 3, 16),
     """
    <p>This is a major release and Glade has seen a world of improvement since 3.4. See the <a href="http://lists.ximian.com/pipermail/glade-users/2009-March/004244.html">full announcement</a> for details.</p>
    <p>Some feature highlights for this version are:</p>
    <ul>
    <li>Support for the old libglade and the new <strong>GtkBuilder format</strong>.</li>
    <li><strong>Target a specific GTK+ version</strong> and only the relevant objects, signals and properties will be avaliable.</li>
    <li><strong>New GTK+ objects avaliable</strong> thanks to GtkBuilder:
        <ul>
        <li>GtkAction</li>
        <li>Gtk+'s MVC elements like GtkTreeView, GtkIconView, GtkComboBox, GtkListStore or GtkTreeStore, allowing to define within Glade all the column, cellrenderer or model elements and connect them to have a working treeview, all that using a specialized editor.</li>
        <li>GtkIconFactory</li>
        <li>GtkSizeGroup</li>
        </ul>
    </li>
    <li><strong>Custom editors</strong> for GtkButton, GtkImage, GtkLabel, GtkEntry and many more.</li>
    <li><strong>Python plugin</strong></li>
    </ul>
    """, 'Juan Pablo Ugarte')

#item("PyGobject 2.18.0 released", (2009, 5, 25),
#     """PyGobject 2.18.0 has been released, this is a stable release, the first of the 2.18.x series. As usual, it's sources can be fetched
#     <a href="http://ftp.gnome.org/pub/GNOME/sources/pygobject/2.18/pygobject-2.18.0.tar.bz2">here</a>.
#     Check out <a href="http://mail.gnome.org/archives/gnome-announce-list/2009-May/msg00065.html">the release announcement and full list of changes</a>.""", 'Gian Mario Tagliaretti')