# Using a Makefile

Here is a Makefile template. It provides some shortcuts for the most common tasks. To view all the available commands,
run `make`.

## Examples

For example, in the [getting started section](../README.md#getting-started), the `docker compose` commands could be
replaced by:

1. Run `make build` to build fresh images.
2. Run `make up` (detached mode without logs).
3. Run `make down` to stop the Docker containers.

Of course, this template is basic for now. But, as your application is growing, you will probably want to add some
targets like running your tests. You can also find a more complete example in
this [snippet](https://www.strangebuzz.com/en/snippets/the-perfect-makefile-for-symfony).

If you want to run make from within the `php` container, in the [Dockerfile](../docker/php/fpm/Dockerfile),
add:

```diff
gettext \
git \
+make \
```

And rebuild the PHP image.

**PS**: If using Windows, you have to install [chocolatey.org](https://chocolatey.org/)
or use [Cygwin](http://cygwin.com) to use the `make` command. Check out this
[StackOverflow question](https://stackoverflow.com/q/2532234/633864) for more explanations.
