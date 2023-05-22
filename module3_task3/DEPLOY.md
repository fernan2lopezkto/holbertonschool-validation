# What is in the archive and how to unarchive it?

-What are the commands to start and stop the application?
-How to customize where the application logs are written?
-How to “quickly” verify that the application is running (healthcheck)?
-A workflow run triggered by a a git tag name 1.0.0 should:

Create a GitHub Release using the “softprops/gh-release” GitHub Action named
1.0.0 and pointing to the tag 1.0.0,
Add the archive awesome-website.zip to the release 1.0.0,
Add the content of the file DEPLOY.md as text for the relase.
