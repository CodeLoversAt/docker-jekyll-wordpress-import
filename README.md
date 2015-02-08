# docker-jekyll-wordpress-import
ready-to-use container to import from a Wordpress installation to jekyll

This container needs the following environment variables:

* `DB_HOST` host name of the MySQL database server
* `DB_DATABASE` name of the wordpress database
* `DB_USERNAME` MySQL username for the wordpress installation
* `DB_PASSWORD` MySQL password for the wordpress installation
* `TABLE_PREFIX` optional table prefix. Defaults to `wp_`

## Usage

Additionally to these environment variables, you need to mount the output directory as `/srv`. Example:

```bash
cd /path/to/jekyll/project
docker run -e DB_HOST=1.2.3.4 \
    -e DB_DATABASE=wordpress \
    -e DB_USERNAME=wordpress \
    -e DB_PASSWORD=passw0rd \
    -v `pwd`:/srv \
    codelovers/jekyll-wordpress-import
```