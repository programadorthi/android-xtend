Eclipse Xtend Android projects
===================

Welcome to android projects using eclipse xtend lang. In that repository I will show many examples of how to use Xtend lang in android projects.

More about Xtend lang follow the link: http://www.eclipse.org/xtend/


Using in Android Studio
=======================

1. Download the [Android Studio 2.2+](http://tools.android.com/download/studio/stable);
2. Configure > Plugins > Browse repositories > Manage repositories > + (add repository);
3. Paste the IntelliJ Releases or Nightly Builds URL from the [Xtend Download page](http://www.eclipse.org/xtend/download.html);
4. Hit ok to add;
5. Hit dropdown 'Repository: All', change to 'Repository: [hudson.eclipse.org](https://hudson.eclipse.org/xtext/job/xtext-intellij/lastSuccessfulBuild/artifact/git-repo/intellij/build/ideaRepository/updatePlugins.xml);
6. Install all the plugins (3 of them);
7. Restart Android Studio.
8. Clone the repository, import the project, build and run.


Warning
-------------

At this moment I am using a local xtend gradle android plugin because the [original plugin 1.0.15](https://github.com/xtext/xtext-gradle-plugin) is not compatible with android gradle plugin 2.2.3.

I already reported this issue and I solved this problem but the original, at this moment, is not updated.
