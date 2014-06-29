This is a proof of concept to demonstrate we can:
- run a sinatra app with jRuby
- run the app in a Java servlet container (Tomcat)
- run the app in Google's Appengine

Contains a small ruby sinatra application under `small_app`.

Make sure you have a working [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html?ssSourceSiteId=otnjp) in your machine before starting!

Some prior experience with Java, Appengine and Ruby would be advisable.

## Sinatra with jRuby

- Install the ruby version
- Install bundler
```
gem install bundler
cd small_app
bundle
```
- Start the application
`bundle exec rackup`
- Point your browser to http://localhost:9292

## Run under Tomcat

- Install [warbler](https://github.com/jruby/warbler)
```
gem install warbler
cd small_app
warble
```
Now our ruby app is packaged in a format suitable for Java containers.

- Download [Apache Tomcat](http://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-8/v8.0.9/bin/apache-tomcat-8.0.9.zip)
- Uncompress anywhere
- Start the server `bin/startup.sh`
- Point your browser to http://localhost:8080
- Go to applications manager
- Install the war file the warbler created `small_app.war`
- Point your browser to http://localhost:8080/small_app
Now you can stop tomcat with `bin/shutdown.sh`.

## Run under Appengine
- Download the [SDK](https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.6.zip)
- Uncompress anywhere
- Uncompress the war file inside appengine's directory, or symlink to the uncompressed war that tomcat created in `webapps/small_app.war`

Appengine applications need an `appengine-web.xml`. Create one next to `web.xml` in your WEB-INF war folder with the following contents:
```
<?xml version="1.0" encoding="utf-8"?>
<appengine-web-app xmlns="http://appengine.google.com/ns/1.0">
  <application>YOUR_APP_NAME</application>
  <version>1</version>
  <threadsafe>true</threadsafe>
</appengine-web-app>
```

- Start the appengine server
`bin/dev_appserver.sh small_app`
- Deploy to appengine production servers. You'll have to create an app first.
`bin/appcfg.sh update small_app`

