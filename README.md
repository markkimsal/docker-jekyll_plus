Jekyll plus livereload
=====

The build will run jekyll plus guard with guard-livereload plugins.  Want more guard plugins?  Open an issue and ask.

Install Gems
----

You can install Gems into your current folder under .bundle/ with the following command

```
    docker run --rm -v "$PWD:/src" \
      markkimsal/jekyll-plus bundle install
```

The default BUNDLE\_PATH of /src/.bundle can be overridden with

```
    docker run --rm -v "$PWD:/src" \
	  -e "BUNDLE_PATH=/some/where/else"
      markkimsal/jekyll-plus bundle install
```


Run jekyll server with live reload
-----------

    docker run --rm -v "$PWD:/src" \
      -p 4000:4000 \
      -p 35729:35729 \
      markkimsal/jekyll-plus

This will default to running **jekyll serve -H 0.0.0.0** via the init process of the container.

Add the following JS to your html files:

    <script>document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>

Run Jekyll build one time
-----------------
To make a one time build and use jekyll without the livereload

    docker run --rm  -v "$PWD:/src" \
      -p 4000:4000 \
      -p 35729:35729 \
       markkimsal/jekyll-plus  jekyll build


You can customize the output folder which defaults to /src/\_site/ by binding another volume

    docker run --rm  -v "$PWD:/src" \
      -v "$PWD/../../my_static_build/folder/:/src/_site/" 
      -p 4000:4000 \
      -p 35729:35729 \
      markkimsal/jekyll-plus  jekyll build

Build for production with alternate config
-----------------
You may want to have a separate config file that contains a flag for your production environment.  Something like:

    //_config_prod.yml
    prod: true

so you can disable things like JS tracking and live reload in your dev environment:

    {% unless site.prod %}                                                                                                                                                                  
        <script> document.write('<script src="//' + (location.hostname || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>                           
    {% endunless %} 

You can run a one time build with an alternate config file like this:

    docker run --rm  -v "$PWD:/src" \
      markkimsal/jekyll-plus  jekyll build  --config _config_prod.yml

Build for production with JEKYLL\_ENV
-----------------
You may want to run a production build and set the jekyll.environment flag to production.  This will allow you to check this flag in Liquid syntax which defaults to "development" if you don't specify a setting from command line

    {% if jekyll.environment == "production" %}
        {% include disqus.html %}
    {% endif %}

You can run a one time build and specify the jekyll.environment flag with this:

    docker run --rm  -v "$PWD:/src" \
	  -e "JEKYLL_ENV=production" \
      markkimsal/jekyll-plus  jekyll build
