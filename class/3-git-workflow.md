Introduction to Git
===================

Git is a fast, open source, distributed version control system. It's unlike CVS, SourceSafe, ClearCase, Subversion or Perforce, and is somewhat like Mercurial (Hg). Distributed means it works offline. Git is an essential enabler of the ecosystem of Ruby and Ruby-on-Rails.

Git Snapshots
-------------

A git commit is a snapshot of all files and meta information at a given point in time, not a file diff.

A New Git Repository
--------------------

Create a GIT repostory offline. We'll call this one *red*.

    $ mkdir ga
    $ cd ga
    ga$ mkdir red
    ga$ cd red

    ga/red$ git init
    Initialized empty Git repository in /home/dblock/sourcega/red/.git/

    ga/red$ touch README.md

    ga/red$ git add README.md

    ga/red$ git status

    # On branch master
    #
    # Initial commit
    #
    # Changes to be committed:
    #   (use "git rm --cached <file>..." to unstage)
    #
    #	new file:   README.md
    #

    ga/red$ git commit -m "Added README."
    [master (root-commit) 3923738] Added README.
     0 files changed, 0 insertions(+), 0 deletions(-)
     create mode 100644 README.md

    ga/red$ 

Examine the history of this repository.

    ga/red$ git log

    commit 392373835e0f7702251d45a088664918e9125c97
    Author: dblock
    Date:   Mon Dec 5 09:34:08 2011 -0500

    Added README.

Exercise
--------

Modify the contents of *README.md* in [Markdown](http://daringfireball.net/projects/markdown/syntax) format and commit the changes.

Pushing to Github
-----------------

A distributed source control lets you push changes to a *remote* repository. We'll use Github. [Create a new repository on Github](https://github.com/repositories/new) called *red*. That's an empty repository with no files. Github ran the same GIT commands as we just did on their servers.

We can connect our local *red* repository with Github's by adding a remote location called *origin*. This name is just a convention.

    ga/red$ git remote add origin git@github.com:<username>/red.git

Push all our changes to Github.

    ga/red$ git push -u origin master

Next time you can push all pending changes on all branches.

    ga/red$ git push

Cloning
-------

Use `git clone` to get a copy of an existing Github repository to your local machine.

    ga$ git clone git@github.com:<username>/red.git green

This creates a new folder called *green* with the contents of the *red* repository.

Pulling
-------

To update the local repository to the changes in the remote repository, use *git pull*.

Topical Branches
----------------

Unlike other source controls, branches are cheap. You almost never work on the *master* branch. Instead, create a topical branch. 

    ga/red$ git checkout -b readme-changes
    Switched to a new branch 'readme-changes'

    ga/red$ git status
    # On branch readme-changes
    nothing to commit (working directory clean)

After you make commits on a branch, push them to Github.

    ga/red$ git push origin readme-changes

Exercise
--------

Make a change to README in your local *red* repository in a new branch, *push* it to Github and *pull* the branch into your local *green* copy.

Forking
-------

To contribute to someone else's work, create a new *fork*, then clone your fork to your local environment. To submit changes, make *pull requests*.

Exercise
--------

In pairs, fork each-other's repositories, clone your fork, make a change to *README.md* and create a pull request. Examine the difference on Github and merge the pull request.

Next
====

* [Ruby Basics](4-ruby-basics.md)

Links
-----

* [Learn Git](http://learn.github.com/p/intro.html)

