Jekyll plus livereload
=====

The build will run jekyll plus guard with guard-livereload plugins.  Want more guard plugins?  Open an issue and ask.


Run jekyll server with live reload
-----------

    docker run --rm -v "$PWD:/src" -p 4000:4000 -p 35729:35729 markkimsal/jekyll-plus

This will default to running jekyll server -H 0.0.0.0 via the init process of the container.

Add the following JS to your html files:

    <script>document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>

Run Jekyll build one time
-----------------
To make a one time build and use jekyll without the livereload
    run --rm  -v "$PWD:/src" -p 4000:4000 -p 35729:35729 markkimsal/jekyll-plus  jekyll build


You can customize the output folder which defaults to /src/\_site/ by binding another volume

run --rm  -v "$PWD:/src" -v "$PWD/../../my\_static\_build/folder/:/src/\_site/" -p 4000:4000 -p 35729:35729 markkimsal/jekyll-plus  jekyll build
